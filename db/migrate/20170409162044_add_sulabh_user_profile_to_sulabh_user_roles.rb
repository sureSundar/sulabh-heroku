class AddSulabhUserProfileToSulabhUserRoles < ActiveRecord::Migration
  def change
    add_column :sulabh_user_roles, :sulabh_user_profile_id, :integer
  end
end
