class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :require_token, only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = current_user.family_users
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def icon_download
    image = User.find(params[:user_id]).user_icon
    if image
      send_data image.icon, type: image.content_type, disposition: 'inline'
    else
      render nothing: true, status: 404
    end
  end

  def icon_upload
    image = current_user.user_icon || UserIcon.new(user_id: current_user.id)
    image.icon = request.body.read
    image.content_type = request.media_type
    if image.save
      render json: image, except: [:icon]
    else
      render json: {error: :faild_save}.to_json , status: 500
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:family_id, :name, :birthday, :gender, :role, :email, :password, :device_code)
    end
end
