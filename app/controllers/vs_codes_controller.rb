# frozen_string_literal: true

class VsCodesController < ApplicationController
  before_action :set_vs_code, only: %i[show edit update destroy]

  # GET /vs_codes
  # GET /vs_codes.json
  def index
    @vs_codes = VsCode.all
  
  end

  # GET /vs_codes/1
  # GET /vs_codes/1.json
  def show; end

  # GET /vs_codes/new
  def new
    @vs_code = VsCode.new
  end

  # GET /vs_codes/1/edit
  def edit; end

  # POST /vs_codes
  # POST /vs_codes.json
  def create
    @vs_code = VsCode.new(vs_code_params)

    respond_to do |format|
      if @vs_code.save
        format.html { redirect_to @vs_code, notice: 'Vs code was successfully created.' }
        format.json { render :show, status: :created, location: @vs_code }
      else
        format.html { render :new }
        format.json { render json: @vs_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vs_codes/1
  # PATCH/PUT /vs_codes/1.json
  def update
    respond_to do |format|
      if @vs_code.update(vs_code_params)
        format.html { redirect_to @vs_code, notice: 'Vs code was successfully updated.' }
        format.json { render :show, status: :ok, location: @vs_code }
      else
        format.html { render :edit }
        format.json { render json: @vs_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vs_codes/1
  # DELETE /vs_codes/1.json
  def destroy
    @vs_code.destroy
    respond_to do |format|
      format.html { redirect_to vs_codes_url, notice: 'Vs code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vs_code
    @vs_code = VsCode.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vs_code_params
    params.require(:vs_code).permit(:name, :points)
  end
end
