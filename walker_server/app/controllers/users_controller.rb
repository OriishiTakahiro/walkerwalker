class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

 	# Get /
	def preview
		@user = User.find(1)
		@questlist = Gpsquest.all
		render :haml => 'preview.html.haml'
	end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
		@user.userhash = nil
		while !@user.userhash do
			tmp = ((1..9).to_a + ('a'..'z').to_a).sample(25).join
			@user.userhash = tmp if User.where(:userhash => tmp).empty?
		end
    respond_to do |format|
      if @user.save
				mystep = Step.new(:total_step => 0,:stock_step => 0)
				mystep.save
				StepUser.new(:step_id => mystep.id , :user_id => @user.id).save
				format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
		relation = StepUser.find_by_user_id(@user.id)
		mystep = Step.find(relation.step_id)
		relation.destroy
		mystep.destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :pass, :userhash)
    end
end
