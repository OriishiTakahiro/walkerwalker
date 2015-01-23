class ItemsUsersController < ApplicationController
  before_action :set_items_user, only: [:show, :edit, :update, :destroy]

  # GET /items_users
  # GET /items_users.json
  def index
    @items_users = ItemsUser.all
  end

  # GET /items_users/1
  # GET /items_users/1.json
  def show
  end

  # GET /items_users/new
  def new
    @items_user = ItemsUser.new
  end

  # GET /items_users/1/edit
  def edit
  end

  # POST /items_users
  # POST /items_users.json
  def create
    @items_user = ItemsUser.new(items_user_params)

    respond_to do |format|
      if @items_user.save
        format.html { redirect_to @items_user, notice: 'Items user was successfully created.' }
        format.json { render :show, status: :created, location: @items_user }
      else
        format.html { render :new }
        format.json { render json: @items_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_users/1
  # PATCH/PUT /items_users/1.json
  def update
    respond_to do |format|
      if @items_user.update(items_user_params)
        format.html { redirect_to @items_user, notice: 'Items user was successfully updated.' }
        format.json { render :show, status: :ok, location: @items_user }
      else
        format.html { render :edit }
        format.json { render json: @items_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_users/1
  # DELETE /items_users/1.json
  def destroy
    @items_user.destroy
    respond_to do |format|
      format.html { redirect_to items_users_url, notice: 'Items user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_user
      @items_user = ItemsUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def items_user_params
      params.require(:items_user).permit(:user_id, :item_id)
    end
end
