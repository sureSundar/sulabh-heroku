require 'json'
require 'api/ICICIAppathonAPIXway.rb'

class DewRequestorController < ApplicationController
  before_filter :set_locale

  def dashboard
    	@su = setSUPinSession

 	    @sulabh_loan_requests  = SulabhLoanRequest.where( :sulabh_user_profile_id => @su.id)
      #@openLRs_arr = @sulabh_loan_requests.to_a
      #@openLRs_arr.delete_if { |c| c.sulabh_request_statuses.where(:status => "CONFIRMED").count > 0 } 	
      #@sulabh_loan_requests = @openLRs_arr
      #@sulabh_loan_requests = @openLRs_arr && @openLRs_arr.to_h
  	  
  	  
  	  @sulabh_loan_offers = SulabhLoanOffer.where.not(:sulabh_user_profile_id => @su.id).where('expiresby >= :timenow',:timenow => Time.now )
      
  	  @openoffers_arr = @sulabh_loan_offers.to_a
      @openoffers_arr.delete_if { |c| c.sulabh_offer_statuses.where(:status => "CONFIRMED").count > 0 ||  c.sulabh_loan_requests.count > 0 } 	
      @sulabh_loan_offers = @openoffers_arr
      #@sulabh_loan_offers = @openoffers_arr && @openoffers_arr.to_h
      #@notice = "Showing all your Open Loan Requests and Available Open Offers from others.."
      @notice = "requestordashboardnotice1"
  	  
  end
  def showOffersLR
    #@su = getSUPFromSession

      @sulabh_loan_requests  = SulabhLoanRequest.where(:id => params[:id])
      #.where( :sulabh_user_profile_id => @su.id)
      #@openLRs_arr = @openLRs.to_a
      #@openLRs_arr.delete_if { |c| c.sulabh_request_statuses.where(:status => "CONFIRMED").count > 0 }   
      
      
      @sulabh_loan_offers = SulabhLoanRequest.find(params[:id]).sulabh_loan_offers
      #SulabhLoanOffer.where(:sulabh_user_profile_id != @su.id && 'expiresby >= :timenow',:timenow => Time.now )
      #@openoffers_arr = @openoffers.to_a
      #@openoffers_arr.delete_if { |c| c.sulabh_offer_statuses.where(:status => "CONFIRMED").count > 0 }  
      #@notice = "Showing Offers for Selected Loan Request"
      @notice = "requestorshowOffersLRnotice1"
      render :file => "dew_requestor/dashboard"
  end

  def createLR
  end

  def myrequests

  end

  def offerLR
    @su = getSUPFromSession
 


  		@sulabh_loan_offer = SulabhLoanOffer.find(params['id'])

      @map = @sulabh_loan_offer.sulabh_req_offer_maps.build
      

  		@sulabh_loan_request = @sulabh_loan_offer.sulabh_loan_requests.count == 0 ?  @sulabh_loan_offer.sulabh_loan_requests.new : @sulabh_loan_offer.sulabh_loan_requests[0] 
  		@sulabh_loan_request.sulabh_user_profile_id = @su["id"]
      @sulabh_loan_request.behavescore = getBehaviourScore(@su["accountno"])
      @sulabh_loan_request.interest = @sulabh_loan_offer.offerinterestrate
  		@sulabh_loan_request.amount = @sulabh_loan_offer.offeramount
  		@sulabh_loan_request.paybydate = @sulabh_loan_offer.paybydate
  		@sulabh_loan_request.requiredby = @sulabh_loan_offer.expiresby
      
      @sulabh_loan_request.save

      @map.sulabh_loan_request_id = @sulabh_loan_request.id
      @map.sulabh_loan_offer_id = @sulabh_loan_offer.id
      @map.save

  		@notice = 'Your prefilled Loan Application form'

		  #render :file => "sulabh_loan_requests/_form.html"  		
      params[:id] = @sulabh_loan_request.id
      params[:id1] = @sulabh_loan_offer.id
      loan_confirm
  		
  end

def loan_confirm
      request_id = params[:id]
      offer_id = params[:id1]
      
      @lrSUP = SulabhUserProfile.find(SulabhLoanRequest.find(request_id).sulabh_user_profile_id)
      @loSUP = SulabhUserProfile.find(SulabhLoanOffer.find(offer_id).sulabh_user_profile_id)

      @slr = SulabhLoanRequest.find(request_id)
      
      @slo = SulabhLoanOffer.find(offer_id)
      
      if (@lrSUP.id === @loSUP.id) 
        @notice ="You cant match your offer to a loan from you."
        session['lc'] = session['sloan'] = session['soffer'] = nil
        render "/fluidic/requestflow"
      else

          
          #@lc = SulabhLoanConfirm.where(:sulabh_loan_request_id == request_id).where(:sulabh_loan_offer_id == offer_id)
          #@lc = nil
          #@lc = @lc != nil ? @lc[0] : nil
          if (@slr.sulabh_loan_confirms.count == 0 && @slo.sulabh_loan_confirms.count == 0)
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
            @sf.procfee = loanamount * 0.001
            @sf.approvedintrate = interestrate
            ct = Time.now
            installmentcount = (paybydate.year * 12 + paybydate.month) - (ct.year * 12 + ct.month)
            @sf.installmentcount = installmentcount
            @sf.installmentfrequency = "Monthly"
            @EMI = calculateEMI(loanamount,interestrate,paybydate)
            @sf.EMI = @EMI
            @disburseAmount = loanamount - @sf.procfee - @sf.policypremium
            @disburseAmount = @disburseAmount.round(2)
            @sf.disbursedAmount = @disburseAmount            
            @sf.save

            @lc.sulabh_policy_id = @sp.id
            @lc.sulabh_financial_id = @sf.id
            @lc.save
            
            #@slr = SulabhLoanRequest.find(@lc.sulabh_loan_request_id)
            #@slr.sulabh_loan_confirm_id = @lc.id
            #@slr.save

            #@slo = SulabhLoanOffer.find(@lc.sulabh_loan_offer_id)
            #@slo.sulabh_loan_confirm_id = @lc.id
            #@slo.save

            @los = @slo.sulabh_offer_statuses.build
            @los.sulabh_loan_offer_id = @lc.sulabh_loan_offer_id
            @los.status="CONFIRMED"
            @los.save

            @lrs = @slr.sulabh_request_statuses.build
            @lrs.sulabh_loan_request_id = @lc.sulabh_loan_request_id
            @lrs.status="CONFIRMED"
            @lrs.save

            if ((@lrSUP.accountno != nil && @lrSUP.accountno) != (@loSUP.accountno !=nil && @loSUP.accountno))
                autoDisburse(@loSUP.accountno,@lrSUP.accountno,@disburseAmount,"NA","1","school fee payment")
            else
              @notice ="Either of SrcAcc or DestAcc is empty or same.Cant transfer funds between empty or same accounts..."
              render "fluidic/requestflow"
            end          
          else
            @notice ="Loan has already been CONFIRMED and Fund has been disbursed.Here are the details for your reference"
            #@lc = @slo.sulabh_loan_confirms[0]["id"] == @slr.sulabh_loan_confirms[0]["id"] ? @slr.sulabh_loan_confirms[0] : ""
            @lc = @slo.sulabh_loan_confirms[0]
            @sf = SulabhFinancial.find(@lc.sulabh_financial_id)
            @sp = SulabhPolicy.find(@lc.sulabh_policy_id)
            @los = @slo.sulabh_offer_statuses
            @lrs = @slr.sulabh_request_statuses
            loanamount = @sf.loanamount
            @disburseAmount = loanamount - @sf.procfee - @sf.policypremium
            @disburseAmount = @disburseAmount.round(2)
          end  

          

          #session['sloan'] = session['soffer'] = nil 
          #session['lc'] = @lc.id
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
      sp.premium = premium.round(2)
      sp.startdate = Time.now
      sp.enddate = paybydate
      sp.save
      return sp
      #behavescorepremium = 
  end 
  
  def calculateEMI(loanamount,interestrate,paybydate)
      @P = loanamount
      @R = interestrate/100
      @ct = Time.now
      @N = (paybydate.year * 12 + paybydate.month) - (@ct.year * 12 + @ct.month)
      @EMI = (@P * @R * ((1+@R) ** @N))/((1+@R) ** @N -1)
      puts "EMI"
      puts @EMI
      return @EMI.round(2)
  end

  def calculateStandardPremium(loanamount,interestrate,paybydate)

      return loanamount*interestrate * 1.25 * 0.0005

  end
  def calculateBehaveScorePremium(lc)
      return 2
  end 

def autoDisburse(srcAcc,destAcc,amt,payeedesc,payeeId,tot)
  
  
  puts "destAccount"
  puts destAcc
  
  puts "srcAcc"
  puts srcAcc
  
  puts "Amount"
  puts amt
  #payeedesc="NA"
  #payeeId=1
  #tot="Auto Dispursement against Loan : #{accept_obj.loan} "
  #tot="school fee payment"

@token = getAPITokern

puts ""
puts "Triggering FundTransfer API..."
fundTransferObj = ICICIAppathonAPIXway.new("fundTransfer")
options_ft = {query: { client_id: @c_id , token: @token , srcAccount: srcAcc, destAccount: destAcc, amt: amt,payeeDesc: "NA",payeeId: "1", type_of_transaction: tot }}
@fTResult = fundTransferObj.getResponseWithOptions(options_ft)
puts @fTResult
@notice = { :req => options_ft, :res => @fTResult}

@notice

end

def getBehaviourScore(act_no)

    @token = getAPITokern

    puts ""
    puts "Triggering BehaviourScore API..."
    bScoreObj= ICICIAppathonAPIXway.new("behaviourScore")
    @c_id = 'suresundar@gmail.com'
    options_ctano = { query: { client_id: @c_id , token: @token , accountno: act_no }}
    @bScoreResult = bScoreObj.getResponseWithOptions(options_ctano)
    puts @bScoreResult
    
    if @bScoreResult[1]["score"] != nil 
        return @bScoreResult["score"] 
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

# U tility functions

private
	def setSUPinSession
		session['su'] = SulabhUserProfile.where(:mobile => current_user.phoneno)[0]
		session['su']
	end
  def getSUPFromSession
    #session['su'] = SulabhUserProfile.where(:mobile => current_user.phoneno)[0]
    return session['su']
  end

end
