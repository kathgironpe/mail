class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers, id: false, primary_key: :uid do |t|
      t.string :uid, index: true
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :store_id, index: true

      t.timestamps
    end
  end
end
