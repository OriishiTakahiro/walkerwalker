class GpsquestsController < ApplicationController
  before_action :set_gpsquest, only: [:show, :edit, :update, :destroy]

  # GET /gpsquests
  # GET /gpsquests.json
  def index
    @gpsquests = Gpsquest.all
  end

  # GET /gpsquests/1
  # GET /gpsquests/1.json
  def show
  end

  # GET /gpsquests/new
  def new
    @gpsquest = Gpsquest.new
  end

  # GET /gpsquests/1/edit
  def edit
  end

  # POST /gpsquests
  # POST /gpsquests.json
  def create
    @gpsquest = Gpsquest.new(gpsquest_params)

    respond_to do |format|
      if @gpsquest.save
        format.html { redirect_to @gpsquest, notice: 'Gpsquest was successfully created.' }
        format.json { render :show, status: :created, location: @gpsquest }
      else
        format.html { render :new }
        format.json { render json: @gpsquest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gpsquests/1
  # PATCH/PUT /gpsquests/1.json
  def update
    respond_to do |format|
      if @gpsquest.update(gpsquest_params)
        format.html { redirect_to @gpsquest, notice: 'Gpsquest was successfully updated.' }
        format.json { render :show, status: :ok, location: @gpsquest }
      else
        format.html { render :edit }
        format.json { render json: @gpsquest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpsquests/1
  # DELETE /gpsquests/1.json
  def destroy
    @gpsquest.destroy
    respond_to do |format|
      format.html { redirect_to gpsquests_url, notice: 'Gpsquest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpsquest
      @gpsquest = Gpsquest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gpsquest_params
      params.require(:gpsquest).permit(:longitude, :latitude, :reward)
    end
end
