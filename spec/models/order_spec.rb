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
require 'rails_helper'

describe Order, type: :model do
  context 'associations' do
    it { should belong_to(:store) }
    it { should belong_to(:subscriber) }
    it { should have_many(:line_items) }
  end

  context 'validations' do
    it { should validate_presence_of(:subscriber_uid) }
    it { should validate_presence_of(:store_id) }
    it { should validate_presence_of(:total) }
  end
end
