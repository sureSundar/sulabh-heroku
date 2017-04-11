class DewRequestorController < ApplicationController
  def dashboard
    	@su = setSUPinSession

 	    @sulabh_loan_requests  = SulabhLoanRequest.where( :sulabh_user_profile_id => @su.id)
      #@openLRs_arr = @openLRs.to_a
      #@openLRs_arr.delete_if { |c| c.sulabh_request_statuses.where(:status => "CONFIRMED").count > 0 } 	
  	  
  	  
  	  @sulabh_loan_offers = SulabhLoanOffer.where(:sulabh_user_profile_id != @su.id && 'expiresby >= :timenow',:timenow => Time.now )
  	  #@openoffers_arr = @openoffers.to_a
      #@openoffers_arr.delete_if { |c| c.sulabh_offer_statuses.where(:status => "CONFIRMED").count > 0 } 	
  	  
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
      render :file => "dew_requestor/dashboard"
  end

  def createLR
  end

  def myrequests

  end

  def offerLR
    @su = getSUPFromSession
  		@sulabh_loan_offer = SulabhLoanOffer.find(params['id'])
  		@sulabh_loan_request = @sulabh_loan_offer.sulabh_loan_requests.new
  		@sulabh_loan_request.sulabh_user_profile_id = @su["id"]
      @sulabh_loan_request.interest = @sulabh_loan_offer.offerinterestrate
  		@sulabh_loan_request.amount = @sulabh_loan_offer.offeramount
  		@sulabh_loan_request.paybydate = @sulabh_loan_offer.paybydate
  		@sulabh_loan_request.requiredby = @sulabh_loan_offer.expiresby
      @sulabh_loan_request.save

  		@notice = 'Your prefilled Loan Application form'
		render :file => "sulabh_loan_requests/_form.html"  		

  		
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
