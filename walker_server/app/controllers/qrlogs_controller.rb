class QrlogsController < ApplicationController
  before_action :set_qrlog, only: [:show, :edit, :update, :destroy]

  # GET /qrlogs
  # GET /qrlogs.json
  def index
    @qrlogs = Qrlog.all
  end

  # GET /qrlogs/1
  # GET /qrlogs/1.json
  def show
  end

  # GET /qrlogs/new
  def new
    @qrlog = Qrlog.new
  end

  # GET /qrlogs/1/edit
  def edit
  end

  # POST /qrlogs
  # POST /qrlogs.json
  def create
    @qrlog = Qrlog.new(qrlog_params)

    respond_to do |format|
      if @qrlog.save
        format.html { redirect_to @qrlog, notice: 'Qrlog was successfully created.' }
        format.json { render :show, status: :created, location: @qrlog }
      else
        format.html { render :new }
        format.json { render json: @qrlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qrlogs/1
  # PATCH/PUT /qrlogs/1.json
  def update
    respond_to do |format|
      if @qrlog.update(qrlog_params)
        format.html { redirect_to @qrlog, notice: 'Qrlog was successfully updated.' }
        format.json { render :show, status: :ok, location: @qrlog }
      else
        format.html { render :edit }
        format.json { render json: @qrlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qrlogs/1
  # DELETE /qrlogs/1.json
  def destroy
    @qrlog.destroy
    respond_to do |format|
      format.html { redirect_to qrlogs_url, notice: 'Qrlog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qrlog
      @qrlog = Qrlog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qrlog_params
      params.require(:qrlog).permit(:userhash, :code)
    end
end
