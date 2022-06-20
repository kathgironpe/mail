# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  price      :decimal(10, 2)
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint
#  product_id :bigint
#
# Indexes
#
#  index_line_items_on_order_id    (order_id)
#  index_line_items_on_product_id  (product_id)
#
require 'rails_helper'

describe LineItem, type: :model do
  context 'associations' do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
  end

  context 'validations' do
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:product_id) }
    it { should validate_presence_of(:quantity) }
  end
end
