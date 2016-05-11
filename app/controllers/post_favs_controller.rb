class PostFavsController < ApplicationController
  before_action :set_post_fav, only: [:show, :edit, :update, :destroy]

  # GET /post_favs
  # GET /post_favs.json
  def index
    @post_favs = PostFav.all
  end

  # GET /post_favs/1
  # GET /post_favs/1.json
  def show
  end

  # GET /post_favs/new
  def new
    @post_fav = PostFav.new
  end

  # GET /post_favs/1/edit
  def edit
  end

  # POST /post_favs
  # POST /post_favs.json
  def create
    @post_fav = PostFav.new(post_fav_params)

    respond_to do |format|
      if @post_fav.save
        GcmNotificator.push_fav(faved_user(@post_fav))
        format.html { redirect_to @post_fav, notice: 'Post fav was successfully created.' }
        format.json { render :show, status: :created, location: @post_fav }
      else
        format.html { render :new }
        format.json { render json: @post_fav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_favs/1
  # PATCH/PUT /post_favs/1.json
  def update
    respond_to do |format|
      if @post_fav.update(post_fav_params)
        format.html { redirect_to @post_fav, notice: 'Post fav was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_fav }
      else
        format.html { render :edit }
        format.json { render json: @post_fav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_favs/1
  # DELETE /post_favs/1.json
  def destroy
    @post_fav.destroy
    respond_to do |format|
      format.html { redirect_to post_favs_url, notice: 'Post fav was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_fav
      @post_fav = PostFav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_fav_params
      params.require(:post_fav).permit(:post_id, :user_id)
    end

    def fav_post(post_fav)
      Post.find_by(id: post_fav.post_id)
    end

    def faved_user(post_fav)
      User.find_by(id: fav_post(Post.find_by(id: post_fav.post_id)).user_id)
    end
end
