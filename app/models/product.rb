# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint
#
# Indexes
#
#  index_products_on_store_id  (store_id)
#
class Product < ApplicationRecord
  belongs_to :store

  validates :store_id, presence: true
  validates :title, presence: true
end
