class SulabhPolicyClaimsController < ApplicationController
  before_action :set_sulabh_policy_claim, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_policy_claims
  # GET /sulabh_policy_claims.json
  def index
    @sulabh_policy_claims = SulabhPolicyClaim.all
  end

  # GET /sulabh_policy_claims/1
  # GET /sulabh_policy_claims/1.json
  def show
  end

  # GET /sulabh_policy_claims/new
  def new
    @sulabh_policy_claim = SulabhPolicyClaim.new
  end

  # GET /sulabh_policy_claims/1/edit
  def edit
  end

  # POST /sulabh_policy_claims
  # POST /sulabh_policy_claims.json
  def create
    @sulabh_policy_claim = SulabhPolicyClaim.new(sulabh_policy_claim_params)

    respond_to do |format|
      if @sulabh_policy_claim.save
        format.html { redirect_to @sulabh_policy_claim, notice: 'Sulabh policy claim was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_policy_claim }
      else
        format.html { render :new }
        format.json { render json: @sulabh_policy_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_policy_claims/1
  # PATCH/PUT /sulabh_policy_claims/1.json
  def update
    respond_to do |format|
      if @sulabh_policy_claim.update(sulabh_policy_claim_params)
        format.html { redirect_to @sulabh_policy_claim, notice: 'Sulabh policy claim was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_policy_claim }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_policy_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_policy_claims/1
  # DELETE /sulabh_policy_claims/1.json
  def destroy
    @sulabh_policy_claim.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_policy_claims_url, notice: 'Sulabh policy claim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_policy_claim
      @sulabh_policy_claim = SulabhPolicyClaim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_policy_claim_params
      params.require(:sulabh_policy_claim).permit(:policyno, :claimno, :claimstatus, :claimedamount, :settlementamount)
    end
end
