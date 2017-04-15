class ChangeTypeInSulabhSaving < ActiveRecord::Migration
  def change
  	rename_column :sulabh_savings, :type, :trans_type
  end
end
