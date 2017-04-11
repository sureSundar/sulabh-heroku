class AddSulabhUserProfileToSulabhLoanOffers < ActiveRecord::Migration
  def change
    add_column :sulabh_loan_offers, :sulabh_user_profile_id, :integer
  end
end
