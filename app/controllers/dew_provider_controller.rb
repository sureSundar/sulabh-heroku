class DewProviderController < ApplicationController
def dashboard
    	@su = setSUPinSession

 	    @sulabh_loan_requests  = SulabhLoanRequest.where.not( :sulabh_user_profile_id => @su.id)
      @openLRs_arr = @openLRs.to_a
      @openLRs_arr.delete_if { |c| c.sulabh_request_statuses.where(:status => "CONFIRMED").count > 0 } 	
  	  
  	  # => @sulabh_loan_offers = SulabhLoanOffer.where(:sulabh_user_profile_id != @su.id && 'expiresby >= :timenow',:timenow => Time.now )
  	  @sulabh_loan_offers = SulabhLoanOffer.where(:sulabh_user_profile_id => @su.id).where('expiresby >= :timenow',:timenow => Time.now )
  	  @openoffers_arr = @openoffers.to_a
      @openoffers_arr.delete_if { |c| c.sulabh_offer_statuses.where(:status => "CONFIRMED").count > 0 } 	
 end 	  
  def offer
  end

  def LRoffer
	    @su = getSUPFromSession
  		@sulabh_loan_request = SulabhLoanRequest.find(params['id'])
  		@map = @sulabh_loan_request.sulabh_req_offer_maps.build
  		@map.sulabh_loan_request_id = @sulabh_loan_request.id

  		@sulabh_loan_offer = @sulabh_loan_request.sulabh_loan_offers.new
  		@sulabh_loan_offer.sulabh_user_profile_id = @su["id"]
      	@sulabh_loan_offer.offerinterestrate = [@sulabh_loan_request.mininterest == nil ? 0 : @sulabh_loan_request.mininterest, @sulabh_loan_request.maxinterest == nil ? 0 : @sulabh_loan_request.maxinterest, @sulabh_loan_request.interest == nil ? 0 : @sulabh_loan_request.interest].max
  		@sulabh_loan_offer.offeramount = @sulabh_loan_request.amount
  		@sulabh_loan_offer.paybydate = @sulabh_loan_request.paybydate
  		@sulabh_loan_offer.expiresby = @sulabh_loan_request.requiredby
  	    @sulabh_loan_offer.save
  	    
  	    @map.sulabh_loan_offer_id = @sulabh_loan_offer.id
  	    @map.save

  		@notice = 'Your prefilled Offer Application form'
		render :file => "sulabh_loan_offers/_form.html"  		

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
