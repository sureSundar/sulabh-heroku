class CreateSulabhUserProfiles < ActiveRecord::Migration
  def change
    create_table :sulabh_user_profiles do |t|
      t.string :name
      t.references :address, index: true, foreign_key: true
      t.string :email
      t.string :mobile
      t.string :aadhar
      t.string :accountno
      t.string :ifsc
      t.string :bank
      t.string :locale
      t.string :occupation
      t.decimal :monthlyrevenue

      t.timestamps null: false
    end
  end
end
