class CreateSulabhFinancials < ActiveRecord::Migration
  def change
    create_table :sulabh_financials do |t|
      t.decimal :loanamount
      t.decimal :policypremium
      t.decimal :procfee
      t.decimal :approvedintrate
      t.integer :installmentcount
      t.string :installmentfrequency

      t.timestamps null: false
    end
  end
end
