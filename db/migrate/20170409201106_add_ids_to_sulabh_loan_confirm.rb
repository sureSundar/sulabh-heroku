class AddIdsToSulabhLoanConfirm < ActiveRecord::Migration
  def change
    add_column :sulabh_loan_confirms, :sulabh_loan_request_id, :integer
    add_column :sulabh_loan_confirms, :sulabh_loan_offer_id, :integer
    add_column :sulabh_loan_confirms, :sulabh_policy_id, :integer
    add_column :sulabh_loan_confirms, :sulabh_financial_id, :integer
  end
end
