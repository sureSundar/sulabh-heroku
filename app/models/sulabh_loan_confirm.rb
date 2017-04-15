class SulabhLoanConfirm < ActiveRecord::Base
  belongs_to :sulabh_loan_request
  belongs_to :sulabh_loan_offer
  belongs_to :sulabh_loan_policy
  belongs_to :sulabh_financial
end
