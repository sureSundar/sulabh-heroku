class SulabhPoliciesController < ApplicationController
  before_action :set_sulabh_policy, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_policies
  # GET /sulabh_policies.json
  def index
    @sulabh_policies = SulabhPolicy.all
  end

  # GET /sulabh_policies/1
  # GET /sulabh_policies/1.json
  def show
  end

  # GET /sulabh_policies/new
  def new
    @sulabh_policy = SulabhPolicy.new
  end

  # GET /sulabh_policies/1/edit
  def edit
  end

  # POST /sulabh_policies
  # POST /sulabh_policies.json
  def create
    @sulabh_policy = SulabhPolicy.new(sulabh_policy_params)

    respond_to do |format|
      if @sulabh_policy.save
        format.html { redirect_to @sulabh_policy, notice: 'Sulabh policy was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_policy }
      else
        format.html { render :new }
        format.json { render json: @sulabh_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_policies/1
  # PATCH/PUT /sulabh_policies/1.json
  def update
    respond_to do |format|
      if @sulabh_policy.update(sulabh_policy_params)
        format.html { redirect_to @sulabh_policy, notice: 'Sulabh policy was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_policy }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_policies/1
  # DELETE /sulabh_policies/1.json
  def destroy
    @sulabh_policy.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_policies_url, notice: 'Sulabh policy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_policy
      @sulabh_policy = SulabhPolicy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_policy_params
      params.require(:sulabh_policy).permit(:provider, :policyno, :scheme, :premium, :startdate, :enddate)
    end
end
