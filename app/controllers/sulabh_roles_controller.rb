class SulabhRolesController < ApplicationController
  before_action :set_sulabh_role, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_roles
  # GET /sulabh_roles.json
  def index
    @sulabh_roles = SulabhRole.all
  end

  # GET /sulabh_roles/1
  # GET /sulabh_roles/1.json
  def show
  end

  # GET /sulabh_roles/new
  def new
    @sulabh_role = SulabhRole.new
  end

  # GET /sulabh_roles/1/edit
  def edit
  end

  # POST /sulabh_roles
  # POST /sulabh_roles.json
  def create
    @sulabh_role = SulabhRole.new(sulabh_role_params)

    respond_to do |format|
      if @sulabh_role.save
        format.html { redirect_to @sulabh_role, notice: 'Sulabh role was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_role }
      else
        format.html { render :new }
        format.json { render json: @sulabh_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_roles/1
  # PATCH/PUT /sulabh_roles/1.json
  def update
    respond_to do |format|
      if @sulabh_role.update(sulabh_role_params)
        format.html { redirect_to @sulabh_role, notice: 'Sulabh role was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_role }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_roles/1
  # DELETE /sulabh_roles/1.json
  def destroy
    @sulabh_role.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_roles_url, notice: 'Sulabh role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_role
      @sulabh_role = SulabhRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_role_params
      params.require(:sulabh_role).permit(:role)
    end
end
