class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.bigint :store_id, index: true
      t.decimal :total, precision: 10, scale: 2
      t.string :subscriber_uid

      t.timestamps
    end
  end
end
