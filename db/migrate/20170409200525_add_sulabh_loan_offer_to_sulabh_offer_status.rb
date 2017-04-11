class AddSulabhLoanOfferToSulabhOfferStatus < ActiveRecord::Migration
  def change
    add_column :sulabh_offer_statuses, :sulabh_loan_offer_id, :integer
  end
end
