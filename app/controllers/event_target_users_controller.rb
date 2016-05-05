class EventTargetUsersController < ApplicationController
  before_action :set_event_target_user, only: [:show, :edit, :update, :destroy]

  # GET /event_target_users
  # GET /event_target_users.json
  def index
    @event_target_users = EventTargetUser.all
  end

  # GET /event_target_users/1
  # GET /event_target_users/1.json
  def show
  end

  # GET /event_target_users/new
  def new
    @event_target_user = EventTargetUser.new
  end

  # GET /event_target_users/1/edit
  def edit
  end

  # POST /event_target_users
  # POST /event_target_users.json
  def create
    @event_target_user = EventTargetUser.new(event_target_user_params)

    respond_to do |format|
      if @event_target_user.save
        format.html { redirect_to @event_target_user, notice: 'Event target user was successfully created.' }
        format.json { render :show, status: :created, location: @event_target_user }
      else
        format.html { render :new }
        format.json { render json: @event_target_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_target_users/1
  # PATCH/PUT /event_target_users/1.json
  def update
    respond_to do |format|
      if @event_target_user.update(event_target_user_params)
        format.html { redirect_to @event_target_user, notice: 'Event target user was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_target_user }
      else
        format.html { render :edit }
        format.json { render json: @event_target_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_target_users/1
  # DELETE /event_target_users/1.json
  def destroy
    @event_target_user.destroy
    respond_to do |format|
      format.html { redirect_to event_target_users_url, notice: 'Event target user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_target_user
      @event_target_user = EventTargetUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_target_user_params
      params.require(:event_target_user).permit(:event_id, :user_id)
    end
end
