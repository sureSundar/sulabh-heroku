class CreateSulabhLoanRepayActuals < ActiveRecord::Migration
  def change
    create_table :sulabh_loan_repay_actuals do |t|
      t.references :sulabh_loan_confim_id, index: true, foreign_key: true
      t.integer :installment_no
      t.decimal :installment_amount
      t.date :datepaid
      t.decimal :actinterest
      t.decimal :actdueafterinst

      t.timestamps null: false
    end
  end
end
