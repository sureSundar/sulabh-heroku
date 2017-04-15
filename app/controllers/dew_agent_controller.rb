class DewAgentController < ApplicationController
  
  def dashboard
    puts "Received Aadhar"
    puts params[:Aadhar] 

      if (params[:Aadhar] == "" && params[:lstatus] == "" && params[:lc_id] != "")
        @lc = SulabhLoanConfirm.find(params[:lc_id])

        params[:id] = @lc.sulabh_loan_request_id
        params[:id1] = @lc.sulabh_loan_offer_id
        redirect_to  "/dew_requestor/#{@lc.sulabh_loan_request_id}/#{@lc.sulabh_loan_offer_id}/loan_confirm"
      end

      if (params[:Aadhar] != nil && params[:lstatus] != nil && params[:lc_id] == nil)
      end
      if (params[:Aadhar] != nil && params[:lstatus] == "" && params[:lc_id] == "")
        @su = SulabhUserProfile.where(:aadhar => params[:Aadhar])[0]
        session['srole'] = "Agent"
        session['su'] = @su
        session['aadhar'] = params["Aadhar"]
        @sulabh_loan_requests  = SulabhLoanRequest.where( :sulabh_user_profile_id == @su.id)
        puts @sulabh_loan_requests  
        @openLRs_arr = @sulabh_loan_requests.to_a
        @openLRs_arr.delete_if { |c| c.sulabh_request_statuses.where(:status => "CONFIRMED").count == 0 }  
        @sulabh_loan_requests = @openLRs_arr
        
        @sulabh_loan_offers = SulabhLoanOffer.where.not(:sulabh_user_profile_id => @su.id).where('expiresby >= :timenow',:timenow => Time.now )
        
        @openoffers_arr = @sulabh_loan_offers.to_a
        @openoffers_arr.delete_if { |c| c.sulabh_offer_statuses.where(:status => "CONFIRMED").count > 0 ||  c.sulabh_loan_requests.count > 0 }  
        @sulabh_loan_offers = @openoffers_arr
        #@sulabh_loan_offers = @openoffers_arr && @openoffers_arr.to_h
        @notice = "Showing all Open Loan Requests and Available Open Offers from others for Aadhar = #{params['Aadhar']}"
      else
        @sulabh_loan_requests = @sulabh_loan_offers = nil

      end

  end

  def searchByAadhar

  end

  def collectpayment
  end

  def collectsaving
  end

  def collectEMI
  end

  def reconcile
  end
end
