# == Schema Information
#
# Table name: subscribers
#
#  email      :string
#  first_name :string
#  last_name  :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :integer
#
# Indexes
#
#  index_subscribers_on_store_id  (store_id)
#  index_subscribers_on_uid       (uid)
#
require 'rails_helper'

describe Subscriber, type: :model do
  context 'associations' do
    it { should belong_to(:store) }
  end

  context 'validations' do
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:store_id) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe '#subscriber_full_name' do
    subject(:subscriber) { create(:subscriber) }

    it 'should return the full name' do
      expect(subscriber.subscriber_full_name).to eq("#{subscriber.first_name} #{subscriber.last_name}")
    end
  end

  describe '#last_order_amount' do
    let(:subscriber) { create(:subscriber) }

    context 'when subscriber has orders' do
      let!(:order) { create(:order, subscriber_uid: subscriber.uid) }

      it 'should return last_order_amount' do
        expect(subscriber.last_order_amount).to eq(order.total)
      end
    end

    context 'when subscriber has no orders' do
      it 'should return last_order_amount' do
        expect(subscriber.last_order_amount).to eq(nil)
      end
    end
  end

  describe '#store_name' do
    subject(:subscriber) { create(:subscriber) }

    it 'should return store name' do
      expect(subscriber.store_name).to eq(subscriber.store_name)
    end
  end
end
