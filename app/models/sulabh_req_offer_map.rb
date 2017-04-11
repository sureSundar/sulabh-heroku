class SulabhReqOfferMap < ActiveRecord::Base
  belongs_to :sulabh_loan_request
  belongs_to :sulabh_loan_offer
end
