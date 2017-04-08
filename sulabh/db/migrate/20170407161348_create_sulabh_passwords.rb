class CreateSulabhPasswords < ActiveRecord::Migration
  def change
    create_table :sulabh_passwords do |t|
      t.string :password
      t.string :expiry
      t.string :pin

      t.timestamps null: false
    end
  end
end
