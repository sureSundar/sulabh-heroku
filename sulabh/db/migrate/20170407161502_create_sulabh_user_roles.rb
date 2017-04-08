class CreateSulabhUserRoles < ActiveRecord::Migration
  def change
    create_table :sulabh_user_roles do |t|
      t.references :username, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
