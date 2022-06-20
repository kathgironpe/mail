class CreateMailings < ActiveRecord::Migration[7.0]
  def change
    create_table :mailings do |t|
      t.string :from
      t.text :subject
      t.text :html
      t.integer :store_id, index: true

      t.timestamps
    end
  end
end
