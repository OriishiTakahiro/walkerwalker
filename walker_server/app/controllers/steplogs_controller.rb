class SteplogsController < ApplicationController
  before_action :set_steplog, only: [:show, :edit, :update, :destroy]

  # GET /steplogs
  # GET /steplogs.json
  def index
    @steplogs = Steplog.all
  end

  # GET /steplogs/1
  # GET /steplogs/1.json
  def show
  end

  # GET /steplogs/new
  def new
    @steplog = Steplog.new
  end

  # GET /steplogs/1/edit
  def edit
  end

  # POST /steplogs
  # POST /steplogs.json
  def create
    @steplog = Steplog.new(steplog_params)

    respond_to do |format|
      if @steplog.save
        format.html { redirect_to @steplog, notice: 'Steplog was successfully created.' }
        format.json { render :show, status: :created, location: @steplog }
      else
        format.html { render :new }
        format.json { render json: @steplog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steplogs/1
  # PATCH/PUT /steplogs/1.json
  def update
    respond_to do |format|
      if @steplog.update(steplog_params)
        format.html { redirect_to @steplog, notice: 'Steplog was successfully updated.' }
        format.json { render :show, status: :ok, location: @steplog }
      else
        format.html { render :edit }
        format.json { render json: @steplog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steplogs/1
  # DELETE /steplogs/1.json
  def destroy
    @steplog.destroy
    respond_to do |format|
      format.html { redirect_to steplogs_url, notice: 'Steplog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_steplog
      @steplog = Steplog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def steplog_params
      params.require(:steplog).permit(:userhash, :step)
    end
end
