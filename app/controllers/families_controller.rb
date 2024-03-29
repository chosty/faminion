# -*- coding: utf-8 -*-
class FamiliesController < ApplicationController
  skip_before_action :require_token, only: [:create, :findby]
  skip_before_action :require_login, only: [:create, :findby]
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  # GET /families
  # GET /families.json
  #将来的に死ぬ(死んだ)
  #def index
  #  @families = Family.all
  #end

  # GET /families/1
  # GET /families/1.json
  def show
    @family = current_user.my_family
  end

  # GET /families/findby?family_code=x
  #roteing追加
  #params[:family_code]=x
  #findby?family_code=e2f042e2f47281c9
  #xからFamily検索して引っ張ってきて@familyになげる
  def findby
    @family = Family.find_by(family_code: params[:family_code])
    respond_to do |format|
      if @family
        format.json { render :show }
      else
        format.json { render json: {"error" => "家族コードがありません"}, status: :not_found }
      end
    end
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  # POST /families.json
  def create
    @family = Family.new(family_params)
    respond_to do |format|
      if @family.save
        @family.create_family_code
        format.html { redirect_to @family, notice: 'Family was successfully created.' }
        format.json { render :show, status: :created, location: @family }
      else
        format.html { render :new }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /families/1
  # PATCH/PUT /families/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url, notice: 'Family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
      params.require(:family).permit(:name)
    end
end
