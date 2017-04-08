class CreateSulabhRequestStatuses < ActiveRecord::Migration
  def change
    create_table :sulabh_request_statuses do |t|
      t.references :request, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
