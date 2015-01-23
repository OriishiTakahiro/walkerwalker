class GpslogsController < ApplicationController
  before_action :set_gpslog, only: [:show, :edit, :update, :destroy]

  # GET /gpslogs
  # GET /gpslogs.json
  def index
    @gpslogs = Gpslog.all
  end

  # GET /gpslogs/1
  # GET /gpslogs/1.json
  def show
  end

  # GET /gpslogs/new
  def new
    @gpslog = Gpslog.new
  end

  # GET /gpslogs/1/edit
  def edit
  end

  # POST /gpslogs
  # POST /gpslogs.json
  def create
    @gpslog = Gpslog.new(gpslog_params)

    respond_to do |format|
      if @gpslog.save
        format.html { redirect_to @gpslog, notice: 'Gpslog was successfully created.' }
        format.json { render :show, status: :created, location: @gpslog }
      else
        format.html { render :new }
        format.json { render json: @gpslog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gpslogs/1
  # PATCH/PUT /gpslogs/1.json
  def update
    respond_to do |format|
      if @gpslog.update(gpslog_params)
        format.html { redirect_to @gpslog, notice: 'Gpslog was successfully updated.' }
        format.json { render :show, status: :ok, location: @gpslog }
      else
        format.html { render :edit }
        format.json { render json: @gpslog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpslogs/1
  # DELETE /gpslogs/1.json
  def destroy
    @gpslog.destroy
    respond_to do |format|
      format.html { redirect_to gpslogs_url, notice: 'Gpslog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpslog
      @gpslog = Gpslog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gpslog_params
      params.require(:gpslog).permit(:userhash, :longitude, :latitude)
    end
end
