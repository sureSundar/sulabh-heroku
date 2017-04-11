class SulabhLoanOffer < ActiveRecord::Base
#  belongs_to :username
   belongs_to :sulabh_user_profile
   has_many :sulabh_offer_statuses
end
