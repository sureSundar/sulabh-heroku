class CreateSulabhRoles < ActiveRecord::Migration
  def change
    create_table :sulabh_roles do |t|
      t.string :role

      t.timestamps null: false
    end
  end
end
