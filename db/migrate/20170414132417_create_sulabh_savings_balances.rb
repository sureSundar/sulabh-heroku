	class CreateSulabhSavingsBalances < ActiveRecord::Migration
  def change
    create_table :sulabh_savings_balances do |t|
      t.string :aadhar
      t.decimal :currentBal

      t.timestamps null: false
    end
  end
end
