class SulabhUsersController < ApplicationController
  before_action :set_sulabh_user, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_users
  # GET /sulabh_users.json
  def index
    @sulabh_users = SulabhUser.all
  end

  # GET /sulabh_users/1
  # GET /sulabh_users/1.json
  def show
  end

  # GET /sulabh_users/new
  def new
    @sulabh_user = SulabhUser.new
  end

  # GET /sulabh_users/1/edit
  def edit
  end

  # POST /sulabh_users
  # POST /sulabh_users.json
  def create
    @sulabh_user = SulabhUser.new(sulabh_user_params)

    respond_to do |format|
      if @sulabh_user.save
        format.html { redirect_to @sulabh_user, notice: 'Sulabh user was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_user }
      else
        format.html { render :new }
        format.json { render json: @sulabh_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_users/1
  # PATCH/PUT /sulabh_users/1.json
  def update
    respond_to do |format|
      if @sulabh_user.update(sulabh_user_params)
        format.html { redirect_to @sulabh_user, notice: 'Sulabh user was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_user }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_users/1
  # DELETE /sulabh_users/1.json
  def destroy
    @sulabh_user.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_users_url, notice: 'Sulabh user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_user
      @sulabh_user = SulabhUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_user_params
      params.require(:sulabh_user).permit(:username, :password_id)
    end
end
