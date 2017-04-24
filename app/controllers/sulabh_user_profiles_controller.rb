class SulabhUserProfilesController < ApplicationController
  before_action :set_sulabh_user_profile, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_user_profiles
  # GET /sulabh_user_profiles.json
  def index
    @sulabh_user_profiles = SulabhUserProfile.all
  end

  # GET /sulabh_user_profiles/1
  # GET /sulabh_user_profiles/1.json
  def show
  end

  # GET /sulabh_user_profiles/new
  def new
    @sulabh_user_profile = SulabhUserProfile.new
	@sulabh_user_profile.build_sulabh_address
  end

  # GET /sulabh_user_profiles/1/edit
  def edit
  end

  # POST /sulabh_user_profiles
  # POST /sulabh_user_profiles.json
  def create
    @sulabh_user_profile = SulabhUserProfile.new(sulabh_user_profile_params)
    req_role = @sulabh_user_profile.sulabh_user_roles.build
    req_role.role_id = SulabhRole.where(:role => "Requestor")[0]
    req_role.save
    req_role = @sulabh_user_profile.sulabh_user_roles.build
    req_role.role_id = SulabhRole.where(:role => "Provider")[0]
    req_role.save
    session['locale'] = params[:sulabh_user_profile][:locale]

    respond_to do |format|
      if @sulabh_user_profile.save
        format.html { redirect_to @sulabh_user_profile, notice: 'Sulabh user profile was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_user_profile }
      else
        format.html { render :new }
        format.json { render json: @sulabh_user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_user_profiles/1
  # PATCH/PUT /sulabh_user_profiles/1.json
  def update
    session['locale'] = params[:sulabh_user_profile][:locale]
    respond_to do |format|
	 if @sulabh_user_profile.update(sulabh_user_profile_params)
        #format.html { redirect_to @sulabh_user_profile, notice: 'Sulabh user profile was successfully updated.' }
        format.html { redirect_to root_path, notice: 'Sulabh user profile was successfully updated.' }
        #format.html {render 'fluidic/requestflow.html'}
        format.json { render :show, status: :ok, location: @sulabh_user_profile }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_user_profiles/1
  # DELETE /sulabh_user_profiles/1.json
  def destroy
    @sulabh_user_profile.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_user_profiles_url, notice: 'Sulabh user profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_user_profile
      @sulabh_user_profile = SulabhUserProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_user_profile_params
      params.require(:sulabh_user_profile).permit(:name, :email, :mobile, :aadhar, :accountno, :ifsc, :bank, :locale, :occupation, :monthlyrevenue,sulabh_addresses_attributes: [:id,:address1,:address2,:address3,:city,:pincode,:country,:_destroy])
    end
end
