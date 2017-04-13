class SulabhLoanRequestsController < ApplicationController
  before_action :set_sulabh_loan_request, only: [:show, :edit, :update, :destroy]


def getSUPFromSession
    #session['su'] = SulabhUserProfile.where(:mobile => current_user.phoneno)[0]
    return session['su']
end
def getBehaviourScore(act_no)

    @token = getAPITokern

    puts ""
    puts "Triggering BehaviourScore API..."
    bScoreObj= ICICIAppathonAPIXway.new("behaviourScore")
    @c_id = 'suresundar@gmail.com'
    options_ctano = { query: { client_id: @c_id , token: @token , accountno: act_no }}
    @bScoreResult = bScoreObj.getResponseWithOptions(options_ctano)
    puts "Response : #{@bScoreResult}"
    @score = JSON.parse(@bScoreResult)[1]["score"]
    #puts @bScoreResult[0]["score"] 

    if @score != nil 
        return @score
    else
        return nil
    end

end

def getAPITokern
    puts "Triggering AuthToken API"
    authToken = ICICIAppathonAPIXway.new("authToken")
    @aT = JSON.parse(authToken.getResponse)[0]["token"]
    @token = @aT
    @c_id = 'suresundar@gmail.com'
    @password = '4RV6JENO'

    puts @aT
    @aT
end

  # GET /sulabh_loan_requests
  # GET /sulabh_loan_requests.json
  def index
    @sulabh_loan_requests = SulabhLoanRequest.all
  end

  # GET /sulabh_loan_requests/1
  # GET /sulabh_loan_requests/1.json
  def show
  end

  # GET /sulabh_loan_requests/new
  def new
    @sulabh_loan_request = SulabhLoanRequest.new
    @su = getSUPFromSession
    @sulabh_loan_request.sulabh_user_profile_id = @su["id"]
    @sulabh_loan_request.behavescore = getBehaviourScore(@su["accountno"])

  end

  # GET /sulabh_loan_requests/1/edit
  def edit
  end

  # POST /sulabh_loan_requests
  # POST /sulabh_loan_requests.json
  def create
    @sulabh_loan_request = SulabhLoanRequest.new(sulabh_loan_request_params)

    respond_to do |format|
      if @sulabh_loan_request.save
        format.html { redirect_to dew_requestor_dashboard_path, notice: 'Sulabh loan request was successfully created.' }
        #format.html { render "fluidic/loan_applied.html.erb", notice: 'Sulabh loan request was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_loan_request }
      else
        format.html { render :new }
        format.json { render json: @sulabh_loan_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_loan_requests/1
  # PATCH/PUT /sulabh_loan_requests/1.json
  def update
    respond_to do |format|
      if @sulabh_loan_request.update(sulabh_loan_request_params)
        format.html { redirect_to dew_requestor_dashboard_path, notice: 'Sulabh loan request was successfully updated.' }
        #format.html { redirect_to @sulabh_loan_request, notice: 'Sulabh loan request was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_loan_request }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_loan_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_loan_requests/1
  # DELETE /sulabh_loan_requests/1.json
  def destroy
    @sulabh_loan_request.destroy
    respond_to do |format|
      format.html { redirect_to dew_requestor_dashboard_path, notice: 'Sulabh loan request was successfully destroyed.' }
      #format.html { redirect_to sulabh_loan_requests_url, notice: 'Sulabh loan request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_loan_request
      @sulabh_loan_request = SulabhLoanRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_loan_request_params
      params.require(:sulabh_loan_request).permit(:username_id, :sulabh_user_profile_id,:behavescore, :amount, :requiredby, :paybydate, :mininterest, :maxinterest, :interest, :minpaybyamount, :maxpaybyamount)
    end
end
