class AddSulabhLoanRequestToSulabhRequestStatus < ActiveRecord::Migration
  def change
    add_column :sulabh_request_statuses, :sulabh_loan_request_id, :integer
  end
end
