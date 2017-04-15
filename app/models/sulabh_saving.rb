class SulabhSaving < ActiveRecord::Base
  belongs_to :sulabh_user_profile
  belongs_to :sulabh_loan_confirm
end
