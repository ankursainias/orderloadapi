class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :system_id, default: ""
      t.boolean :response, default: true
      t.string :tracker_hash, default: ""

      t.timestamps
    end
  end
end
