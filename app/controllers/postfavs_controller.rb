class PostfavsController < ApplicationController
  before_action :set_postfav, only: [:show, :edit, :update, :destroy]

  # GET /postfavs
  # GET /postfavs.json
  def index
    @postfavs = Postfav.all
  end

  # GET /postfavs/1
  # GET /postfavs/1.json
  def show
  end

  # GET /postfavs/new
  def new
    @postfav = Postfav.new
  end

  # GET /postfavs/1/edit
  def edit
  end

  # POST /postfavs
  # POST /postfavs.json
  def create
    @postfav = Postfav.new(postfav_params)

    respond_to do |format|
      if @postfav.save
        format.html { redirect_to @postfav, notice: 'Postfav was successfully created.' }
        format.json { render :show, status: :created, location: @postfav }
      else
        format.html { render :new }
        format.json { render json: @postfav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postfavs/1
  # PATCH/PUT /postfavs/1.json
  def update
    respond_to do |format|
      if @postfav.update(postfav_params)
        format.html { redirect_to @postfav, notice: 'Postfav was successfully updated.' }
        format.json { render :show, status: :ok, location: @postfav }
      else
        format.html { render :edit }
        format.json { render json: @postfav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postfavs/1
  # DELETE /postfavs/1.json
  def destroy
    @postfav.destroy
    respond_to do |format|
      format.html { redirect_to postfavs_url, notice: 'Postfav was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postfav
      @postfav = Postfav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postfav_params
      params.require(:postfav).permit(:post_id, :user_id)
    end
end
