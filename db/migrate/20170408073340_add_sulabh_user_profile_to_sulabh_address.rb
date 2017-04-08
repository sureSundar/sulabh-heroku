class AddSulabhUserProfileToSulabhAddress < ActiveRecord::Migration
  def change
    add_reference :sulabh_addresses, :sulabh_user_profile, index: true, foreign_key: true
  end
end
