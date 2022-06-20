# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  subscriber_uid :string
#  total          :decimal(10, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  store_id       :bigint
#
# Indexes
#
#  index_orders_on_store_id  (store_id)
#
class Order < ApplicationRecord
  belongs_to :store
  belongs_to :subscriber, foreign_key: :subscriber_uid, primary_key: :uid
  has_many :line_items

  validates :subscriber_uid, presence: true
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :store_id, presence: true
end
