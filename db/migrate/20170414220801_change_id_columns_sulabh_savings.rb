class ChangeIdColumnsSulabhSavings < ActiveRecord::Migration
  def change
  	rename_column :sulabh_savings, :sulabh_user_profile_id_id, :sulabh_user_profile_id
  	rename_column :sulabh_savings, :sulabh_loan_confirm_id_id, :sulabh_loan_confirm_id
  	rename_column :sulabh_loan_repay_schedules, :sulabh_loan_confim_id_id, :sulabh_loan_confirm_id 
  	rename_column :sulabh_loan_repay_actuals, :sulabh_loan_confim_id_id, :sulabh_loan_confirm_id 
  end
end
