class SulabhLoanRequest < ActiveRecord::Base
 # belongs_to :username
  belongs_to :sulabh_user_profile
  has_many :sulabh_request_statuses
end
