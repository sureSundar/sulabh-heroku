class RemoveSulabhAddressFromSulabhUserProfile < ActiveRecord::Migration
  def change
    remove_column :sulabh_user_profiles, :sulabh_address_id, :integer
  end
end
