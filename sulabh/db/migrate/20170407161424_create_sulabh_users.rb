class CreateSulabhUsers < ActiveRecord::Migration
  def change
    create_table :sulabh_users do |t|
      t.string :username
      t.references :password, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
