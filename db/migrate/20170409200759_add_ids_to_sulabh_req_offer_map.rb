class AddIdsToSulabhReqOfferMap < ActiveRecord::Migration
  def change
    add_column :sulabh_req_offer_maps, :sulabh_loan_request_id, :integer
    add_column :sulabh_req_offer_maps, :sulabh_loan_offer_id, :integer
  end
end
