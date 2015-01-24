class QreventsController < ApplicationController
  before_action :set_qrevent, only: [:show, :edit, :update, :destroy]

  # GET /qrevents
  # GET /qrevents.json
  def index
    @qrevents = Qrevent.all
  end

  # GET /qrevents/1
  # GET /qrevents/1.json
  def show
  end

  # GET /qrevents/new
  def new
    @qrevent = Qrevent.new
  end

  # GET /qrevents/1/edit
  def edit
  end

  # POST /qrevents
  # POST /qrevents.json
  def create
    @qrevent = Qrevent.new(qrevent_params)

    respond_to do |format|
      if @qrevent.save
        format.html { redirect_to @qrevent, notice: 'Qrevent was successfully created.' }
        format.json { render :show, status: :created, location: @qrevent }
      else
        format.html { render :new }
        format.json { render json: @qrevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qrevents/1
  # PATCH/PUT /qrevents/1.json
  def update
    respond_to do |format|
      if @qrevent.update(qrevent_params)
        format.html { redirect_to @qrevent, notice: 'Qrevent was successfully updated.' }
        format.json { render :show, status: :ok, location: @qrevent }
      else
        format.html { render :edit }
        format.json { render json: @qrevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qrevents/1
  # DELETE /qrevents/1.json
  def destroy
    @qrevent.destroy
    respond_to do |format|
      format.html { redirect_to qrevents_url, notice: 'Qrevent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qrevent
      @qrevent = Qrevent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qrevent_params
      params.require(:qrevent).permit(:code, :reward)
    end
end
