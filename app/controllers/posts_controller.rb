class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_token, only: [:picture_download]
  skip_before_action :require_login, only: [:picture_download]

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.family_posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    params[:post][:family_id] = current_user.family_id
    params[:post][:user_id] = current_user.id
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        if @post.reply_post_id.blank?
          GcmNotificator.push_post(current_user) #投稿を家族に通知
        else
          GcmNotificator.push_fav(@post.user, current_user)
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def picture_download
    image = PostPicture.find(params[:picture_id])
    if image
      send_data image.picture, type: image.content_type, disposition: 'inline'
    else
      render nothing: true, status: 404
    end
  end

  def picture_upload
    image = PostPicture.new(post_id: params[:post_id])
    image.picture = request.body.read
    image.content_type = request.media_type
    if image.save
      render json: image, except: [:picture]
    else
      render json: {error: :faild_save}.to_json , status: 500
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:family_id, :user_id, :reply_post_id, :post_favs_count, :content)
    end

end
