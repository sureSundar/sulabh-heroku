class SulabhLoanOffersController < ApplicationController
  before_action :set_sulabh_loan_offer, only: [:show, :edit, :update, :destroy]



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


  # GET /sulabh_loan_offers
  # GET /sulabh_loan_offers.json
  def index
    @sulabh_loan_offers = SulabhLoanOffer.all
  end

  # GET /sulabh_loan_offers/1
  # GET /sulabh_loan_offers/1.json
  def show
  end

  # GET /sulabh_loan_offers/new
  def new
    @sulabh_loan_offer ||= SulabhLoanOffer.new
    @su = getSUPFromSession
    @sulabh_loan_offer.sulabh_user_profile_id = @su["id"]
    @sulabh_loan_offer.behavescore = getBehaviourScore(@su["accountno"])   
  end

  # GET /sulabh_loan_offers/1/edit
  def edit
  end
  def openOfferBalance
      @su = getSUPFromSession
      @sulabh_loan_offers = SulabhLoanOffer.where(:sulabh_user_profile_id => @su["id"]).where('expiresby >= :timenow',:timenow => Time.now )
      @openoffers_arr = @sulabh_loan_offers.to_a
      @openoffers_arr.delete_if { |c| c.sulabh_offer_statuses.where(:status => "CONFIRMED").count > 0 } 
      @openBal = 0
      @openoffers_arr.each do |offer|
        @openBal += offer.offeramount.to_i
      end
      puts "opne Balance for #{@su['name']} : "
      puts @openBal
      @openBal
  end
  def getAccountBalance(act_no)
      @token = getAPITokern
      @c_id = 'suresundar@gmail.com'

      puts "Triggering Balance Enquiry API"
      puts "self.Token = "+ @token
      balEnq = ICICIAppathonAPIXway.new("balanceEnquiry")
      puts "Act No :" + act_no
      puts "C ID : " + @c_id
      options_cta = { query: { client_id: @c_id , token: @token , accountno: act_no }}
      @balEnqResult = balEnq.getResponseWithOptions(options_cta)
      puts @balEnqResult
      @accBal = JSON.parse(@balEnqResult)[1]["balance"]
      puts "Account Balace for act_no : #{act_no} : "
      puts @accBal
      @accBal
  end
  # POST /sulabh_loan_offers
  # POST /sulabh_loan_offers.json
  def create
    @su = getSUPFromSession

    # Do OfferVsBalanceCheck
    @currentBalance = getAccountBalance(@su["accountno"])
    @opBal1 = openOfferBalance
    @opBal = (@opBal1 == nil ? 0 : @opBal1.to_i ) + sulabh_loan_offer_params[:offeramount].to_i
    puts "param offeramount"
    puts sulabh_loan_offer_params[:offeramount]

    if (@openBal < @currentBalance.to_i)
      @sulabh_loan_offer = SulabhUserProfile.find(@su["id"]).sulabh_loan_offers.build(sulabh_loan_offer_params) #SulabhLoanOffer.new(sulabh_loan_offer_params)
      respond_to do |format|
        if @sulabh_loan_offer.save
          #format.html { redirect_to fetch_all_offers_path, notice: 'Sulabh loan offer was successfully created.' }
          @notice = "You  seems to have sufficient balance to make this offer.Your Current Account Balance = #{@currentBalance}, Your open offers balance + current Offer Balance = #{@opBal}.Offer Successfully Created"
          format.html { redirect_to dew_provider_dashboard_path, notice: "You  seems to have sufficient balance to make this offer.Your Current Account Balance = #{@currentBalance}, Your open offers balance + current Offer Balance = #{@opBal}.Offer Successfully Created" }
          format.json { render :show, status: :created, location: @sulabh_loan_offer }
        else
          format.html { render :new }
          format.json { render json: @sulabh_loan_offer.errors, status: :unprocessable_entity }
        end
      end
    else

      respond_to do |format|
          #format.html { redirect_to fetch_all_offers_path, notice: 'Sulabh loan offer was successfully created.' }\
          @notice = "You  doesnt seems to have sufficient balance to make this offer.Your Current Account Balance = #{@currentBalance}, Your open offers balance + current Offer Balance = #{@opBal}.Unable to create Offer"
          format.html { redirect_to dew_provider_dashboard_path, notice: "You  doesnt seems to have sufficient balance to make this offer.Your Current Account Balance = #{@currentBalance}, Your open offers balance + current Offer Balance = #{@opBal}.Unable to create Offer" }
          format.json { render :show, status: :created, location: @sulabh_loan_offer }
      end   
     end   
  end

  # PATCH/PUT /sulabh_loan_offers/1
  # PATCH/PUT /sulabh_loan_offers/1.json
  def update
    respond_to do |format|
      if @sulabh_loan_offer.update(sulabh_loan_offer_params)
        format.html { redirect_to dew_provider_dashboard_path, notice: 'Sulabh loan offer was successfully updated.' }
        #format.html { redirect_to @sulabh_loan_offer, notice: 'Sulabh loan offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_loan_offer }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_loan_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_loan_offers/1
  # DELETE /sulabh_loan_offers/1.json
  def destroy
    @sulabh_loan_offer.destroy
    respond_to do |format|
      format.html { redirect_to dew_provider_dashboard_path, notice: 'Sulabh loan offer was successfully destroyed.' }
      #format.html { redirect_to sulabh_loan_offers_url, notice: 'Sulabh loan offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_loan_offer
      @sulabh_loan_offer = SulabhLoanOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_loan_offer_params
      params.require(:sulabh_loan_offer).permit(:username_id, :behavescore, :offeramount, :expiresby, :offerinterestrate, :paybydate, :interestrate)
    end
  def getSUPFromSession
    #session['su'] = SulabhUserProfile.where(:mobile => current_user.phoneno)[0]
    return session['su']
  end    
end
