class CreateSulabhSavings < ActiveRecord::Migration
  def change
    create_table :sulabh_savings do |t|
      t.references :sulabh_user_profile_id, index: true, foreign_key: true
      t.references :sulabh_loan_confirm_id, index: true, foreign_key: true
      t.string :aadhaar
      t.datetime :transaction_date
      t.decimal :debitAmount
      t.decimal :creditAmount
      t.string :remarks
      t.string :status
      t.string :depositedinbank
      t.string :branch_name
      t.datetime :depositDate

      t.timestamps null: false
    end
  end
end
