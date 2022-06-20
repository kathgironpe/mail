class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.bigint :store_id, index: true
      t.string :title

      t.timestamps
    end
  end
end
