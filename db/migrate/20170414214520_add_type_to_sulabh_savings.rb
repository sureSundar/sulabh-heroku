class AddTypeToSulabhSavings < ActiveRecord::Migration
  def change
    add_column :sulabh_savings, :type, :string
  end
end
