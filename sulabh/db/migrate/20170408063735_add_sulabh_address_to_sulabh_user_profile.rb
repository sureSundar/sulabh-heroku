class AddSulabhAddressToSulabhUserProfile < ActiveRecord::Migration
  def change
    add_reference :sulabh_user_profiles, :sulabh_address, index: true, foreign_key: true
  end
end
