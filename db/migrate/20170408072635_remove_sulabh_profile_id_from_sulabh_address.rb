class RemoveSulabhProfileIdFromSulabhAddress < ActiveRecord::Migration
  def change
    remove_column :sulabh_addresses, :sulabh_profile_id, :integer
  end
end
