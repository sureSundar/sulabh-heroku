class CreateSulabhLoanRepaySchedules < ActiveRecord::Migration
  def change
    create_table :sulabh_loan_repay_schedules do |t|
      t.references :sulabh_loan_confim_id, index: true, foreign_key: true
      t.decimal :principal
      t.integer :installment_no
      t.date :installment_due_date
      t.decimal :installment_amount
      t.decimal :interest_for_installment
      t.decimal :due_after_installment

      t.timestamps null: false
    end
  end
end
