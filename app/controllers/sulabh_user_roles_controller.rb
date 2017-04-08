class SulabhUserRolesController < ApplicationController
  before_action :set_sulabh_user_role, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_user_roles
  # GET /sulabh_user_roles.json
  def index
    @sulabh_user_roles = SulabhUserRole.all
  end

  # GET /sulabh_user_roles/1
  # GET /sulabh_user_roles/1.json
  def show
  end

  # GET /sulabh_user_roles/new
  def new
    @sulabh_user_role = SulabhUserRole.new
  end

  # GET /sulabh_user_roles/1/edit
  def edit
  end

  # POST /sulabh_user_roles
  # POST /sulabh_user_roles.json
  def create
    @sulabh_user_role = SulabhUserRole.new(sulabh_user_role_params)

    respond_to do |format|
      if @sulabh_user_role.save
        format.html { redirect_to @sulabh_user_role, notice: 'Sulabh user role was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_user_role }
      else
        format.html { render :new }
        format.json { render json: @sulabh_user_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_user_roles/1
  # PATCH/PUT /sulabh_user_roles/1.json
  def update
    respond_to do |format|
      if @sulabh_user_role.update(sulabh_user_role_params)
        format.html { redirect_to @sulabh_user_role, notice: 'Sulabh user role was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_user_role }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_user_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_user_roles/1
  # DELETE /sulabh_user_roles/1.json
  def destroy
    @sulabh_user_role.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_user_roles_url, notice: 'Sulabh user role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_user_role
      @sulabh_user_role = SulabhUserRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_user_role_params
      params.require(:sulabh_user_role).permit(:username_id, :role_id)
    end
end
