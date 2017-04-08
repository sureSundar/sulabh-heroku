class CreateSulabhLoanOffers < ActiveRecord::Migration
  def change
    create_table :sulabh_loan_offers do |t|
      t.references :username, index: true, foreign_key: true
      t.string :behavescore
      t.decimal :offeramount
      t.datetime :expiresby
      t.decimal :offerinterestrate
      t.datetime :paybydate
      t.decimal :interestrate

      t.timestamps null: false
    end
  end
end
