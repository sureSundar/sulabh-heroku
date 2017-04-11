class FluidicController < ApplicationController
  before_action :authenticate_user!

  def requestflow
  end

  def role_selected
  	puts "role selected.Recieved param #{params['srole']}"
    if (params['srole'] != nil)
      session['srole'] = params['srole']
    end

  	if (params['srole'] === "Requestor")  
  		@su = SulabhUserProfile.where(:mobile => current_user.phoneno)[0]
  		if (@su != nil)
  			@sulabh_loan_requests = @su.sulabh_loan_requests
		  end
    elsif (params['srole'] === "Provider")
      @sulabh_loan_requests = SulabhLoanRequest.where.not( :sulabh_user_profile_id => (SulabhUserProfile.where(:mobile => current_user.phoneno)[0]))
      @sulabh_loan_requests_arr = @sulabh_loan_requests.to_a
      @sulabh_loan_requests_arr.delete_if { |c| c.sulabh_request_statuses.where(:status => "CONFIRMED").count > 0 }
      puts "Inside Provider..."
    end   
     render "fluidic/Requestor_land.html"
  end

  def fetch_offers
    if (params['srole'] != nil)
      session['srole'] = params['srole']
    end

    if params[:id] != nil
      session['sloan'] = params[:id]
    end
    if session['srole'] === "Requestor"
      if params[:id] != nil
        @sulabh_loan_request = SulabhLoanRequest.find(params[:id])
        @offers = SulabhLoanOffer.where(:sulabh_user_profile_id != @sulabh_loan_request.sulabh_user_profile_id && 'expiresby >= :timenow',:timenow => Time.now   )      
      else
        @offers = SulabhLoanOffer.where(:sulabh_user_profile_id != SulabhUserProfile.where(:mobile => current_user.phoneno)[0].id && 'expiresby >= :timenow',:timenow => Time.now   )
      end
    elsif session['srole'] === "Provider"
      if params[:id] != nil
        @sulabh_loan_request = SulabhLoanRequest.find(params[:id])
        #@offers = SulabhLoanOffer.where(:sulabh_user_profile_id == @sulabh_loan_request.sulabh_user_profile_id && 'expiresby >= :timenow',:timenow => Time.now   )      
        @offers = SulabhLoanOffer.where(:sulabh_user_profile_id == SulabhUserProfile.where(:mobile => current_user.phoneno)[0].id && 'expiresby >= :timenow',:timenow => Time.now   )
      else
        @offers = SulabhLoanOffer.where(:sulabh_user_profile_id == SulabhUserProfile.where(:mobile => current_user.phoneno)[0].id && 'expiresby >= :timenow',:timenow => Time.now   )
      end
    end
      render "fluidic/OffersForRequest.html.erb"
  end

  def loan_confirm
      request_id = params[:id]
      offer_id = params[:id1]

      if (SulabhLoanRequest.find(request_id).sulabh_user_profile_id === SulabhLoanOffer.find(offer_id).sulabh_user_profile_id) 
        @notice ="You cant match your offer to a loan from you."
        session['lc'] = session['sloan'] = session['soffer'] = nil
        render "/fluidic/requestflow"
      else

          @lc = SulabhLoanConfirm.new
          @lc.sulabh_loan_request_id = request_id
          @lc.sulabh_loan_offer_id = offer_id
          @sp = SulabhPolicy.new
          @sp = getPolicy(@lc,@sp)
          
          loanamount = [SulabhLoanRequest.find(@lc.sulabh_loan_request_id).amount,SulabhLoanOffer.find(@lc.sulabh_loan_offer_id).offeramount].min
          interestrate = SulabhLoanOffer.find(@lc.sulabh_loan_offer_id).offerinterestrate
          paybydate =  [SulabhLoanRequest.find(@lc.sulabh_loan_request_id).paybydate !=nil ? SulabhLoanRequest.find(@lc.sulabh_loan_request_id).paybydate : Time.now + 3.months,SulabhLoanOffer.find(@lc.sulabh_loan_offer_id).paybydate != nil ? SulabhLoanOffer.find(@lc.sulabh_loan_offer_id).paybydate : Time.now + 3.months].min
          premium = calculateStandardPremium(loanamount,interestrate,paybydate)

          @sf = SulabhFinancial.new
          @sf.loanamount = loanamount
          @sf.policypremium = premium
          @sf.procfee = loanamount * 0.01
          @sf.approvedintrate = interestrate
          @sf.installmentcount = 3
          @sf.installmentfrequency = "Monthly"

          @sf.save

          @lc.sulabh_policy_id = @sp.id
          @lc.sulabh_financial_id = @sf.id
          @lc.save
          
          @los = SulabhLoanOffer.find(@lc.sulabh_loan_offer_id).sulabh_offer_statuses.build
          @los.status="CONFIRMED"
          @los.save

          @lrs = SulabhLoanRequest.find(@lc.sulabh_loan_request_id).sulabh_request_statuses.build
          @lrs.status="CONFIRMED"
          @lrs.save

          session['sloan'] = session['soffer'] = nil 
          session['lc'] = @lc.id
          render "fluidic/loan_confirm.html"
      end
      #sendLCSMS()

  end
  def getPolicy(lc,sp)
      loanamount = [SulabhLoanRequest.find(lc.sulabh_loan_request_id).amount,SulabhLoanOffer.find(lc.sulabh_loan_offer_id).offeramount].min
      interestrate = SulabhLoanOffer.find(lc.sulabh_loan_offer_id).offerinterestrate
      paybydate =  [SulabhLoanRequest.find(lc.sulabh_loan_request_id).paybydate !=nil ? SulabhLoanRequest.find(lc.sulabh_loan_request_id).paybydate : Time.now + 3.months,SulabhLoanOffer.find(lc.sulabh_loan_offer_id).paybydate != nil ? SulabhLoanOffer.find(lc.sulabh_loan_offer_id).paybydate : Time.now + 3.months].min
      premium = calculateStandardPremium(loanamount,interestrate,paybydate)
      sp.provider = "ICICI LOMBARD"
      sp.policyno = "ICICI SULABH #{sp.id}"
      sp.scheme = "SULABH SUVIDHA"
      sp.premium = premium
      sp.startdate = Time.now
      sp.enddate = paybydate
      sp.save
      return sp
      #behavescorepremium = 
  end 
  def calculateStandardPremium(loanamount,interestrate,paybydate)
      return loanamount*interestrate * 1.25 * 0.005

  end
  def calculateBehaveScorePremium(lc)
      return 2
  end 

end

