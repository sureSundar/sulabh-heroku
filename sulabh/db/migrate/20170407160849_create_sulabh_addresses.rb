class CreateSulabhAddresses < ActiveRecord::Migration
  def change
    create_table :sulabh_addresses do |t|
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.decimal :pincode, precision: 6, scale: 0
      t.string :country

      t.timestamps null: false
    end
  end
end
