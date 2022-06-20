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
require 'rails_helper'

describe Product, type: :model do
  context 'associations' do
    it { should belong_to(:store) }
  end


  context 'validations' do
    it { should validate_presence_of(:store_id) }
    it { should validate_presence_of(:title) }
  end
end
