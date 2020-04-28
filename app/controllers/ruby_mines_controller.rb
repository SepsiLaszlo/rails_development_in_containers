class RubyMinesController < ApplicationController
  before_action :set_ruby_mine, only: [:show, :edit, :update, :destroy]

  # GET /ruby_mines
  # GET /ruby_mines.json
  def index
    @ruby_mines = RubyMine.all
  end

  # GET /ruby_mines/1
  # GET /ruby_mines/1.json
  def show
  end

  # GET /ruby_mines/new
  def new
    @ruby_mine = RubyMine.new
  end

  # GET /ruby_mines/1/edit
  def edit
  end

  # POST /ruby_mines
  # POST /ruby_mines.json
  def create
    @ruby_mine = RubyMine.new(ruby_mine_params)

    respond_to do |format|
      if @ruby_mine.save
        format.html { redirect_to @ruby_mine, notice: 'Ruby mine was successfully created.' }
        format.json { render :show, status: :created, location: @ruby_mine }
      else
        format.html { render :new }
        format.json { render json: @ruby_mine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruby_mines/1
  # PATCH/PUT /ruby_mines/1.json
  def update
    respond_to do |format|
      if @ruby_mine.update(ruby_mine_params)
        format.html { redirect_to @ruby_mine, notice: 'Ruby mine was successfully updated.' }
        format.json { render :show, status: :ok, location: @ruby_mine }
      else
        format.html { render :edit }
        format.json { render json: @ruby_mine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruby_mines/1
  # DELETE /ruby_mines/1.json
  def destroy
    @ruby_mine.destroy
    respond_to do |format|
      format.html { redirect_to ruby_mines_url, notice: 'Ruby mine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruby_mine
      @ruby_mine = RubyMine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ruby_mine_params
      params.require(:ruby_mine).permit(:name, :points)
    end
end
