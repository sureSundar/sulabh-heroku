class CreateSulabhPolicies < ActiveRecord::Migration
  def change
    create_table :sulabh_policies do |t|
      t.string :provider
      t.string :policyno
      t.string :scheme
      t.decimal :premium
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps null: false
    end
  end
end
