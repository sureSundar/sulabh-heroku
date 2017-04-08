class CreateSulabhReqOfferMaps < ActiveRecord::Migration
  def change
    create_table :sulabh_req_offer_maps do |t|
      t.references :request, index: true, foreign_key: true
      t.references :offer, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
