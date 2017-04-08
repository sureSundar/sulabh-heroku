class CreateSulabhOfferStatuses < ActiveRecord::Migration
  def change
    create_table :sulabh_offer_statuses do |t|
      t.references :offer, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
