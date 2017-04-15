class AddDisbursedAmountandEmiToSulabhFinancial < ActiveRecord::Migration
  def change
    add_column :sulabh_financials, :disbursedAmount, :decimal
    add_column :sulabh_financials, :EMI, :decimal
  end
end
