class CreateSulabhLoanConfirms < ActiveRecord::Migration
  def change
    create_table :sulabh_loan_confirms do |t|
      t.references :request, index: true, foreign_key: true
      t.references :offer, index: true, foreign_key: true
      t.references :policyno, index: true, foreign_key: true
      t.references :financedetails, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
