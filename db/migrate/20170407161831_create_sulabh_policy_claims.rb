class CreateSulabhPolicyClaims < ActiveRecord::Migration
  def change
    create_table :sulabh_policy_claims do |t|
      t.string :policyno
      t.string :claimno
      t.string :claimstatus
      t.decimal :claimedamount
      t.decimal :settlementamount

      t.timestamps null: false
    end
  end
end
