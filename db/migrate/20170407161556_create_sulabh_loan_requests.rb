class CreateSulabhLoanRequests < ActiveRecord::Migration
  def change
    create_table :sulabh_loan_requests do |t|
      t.references :username, index: true, foreign_key: true
      t.string :behavescore
      t.decimal :amount
      t.datetime :requiredby
      t.datetime :paybydate
      t.decimal :mininterest
      t.decimal :maxinterest
      t.decimal :interest
      t.decimal :minpaybyamount
      t.decimal :maxpaybyamount

      t.timestamps null: false
    end
  end
end
