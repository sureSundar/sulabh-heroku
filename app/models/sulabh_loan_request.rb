class SulabhLoanRequest < ActiveRecord::Base
 # belongs_to :username
  belongs_to :sulabh_user_profile
  has_many :sulabh_request_statuses

  has_many :sulabh_req_offer_maps
  has_many :sulabh_loan_offers,:through => :sulabh_req_offer_maps
end
