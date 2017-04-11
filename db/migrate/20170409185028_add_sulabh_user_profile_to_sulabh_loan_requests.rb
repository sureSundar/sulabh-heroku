class AddSulabhUserProfileToSulabhLoanRequests < ActiveRecord::Migration
  def change
    add_column :sulabh_loan_requests, :sulabh_user_profile_id, :integer
  end
end
