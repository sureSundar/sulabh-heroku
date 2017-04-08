class SulabhLoanConfirm < ActiveRecord::Base
  belongs_to :request
  belongs_to :offer
  belongs_to :policyno
  belongs_to :financedetails
end
