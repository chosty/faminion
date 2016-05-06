class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:email], params[:password])
        format.html { redirect_back_or_to(:users, notice: 'Login successful') }
        format.json { render json: @user.to_json, status: :ok }
      else
        format.html { flash.now[:alert] = 'Login failed'; render action: 'new' }
        format.json { render json: {}, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
