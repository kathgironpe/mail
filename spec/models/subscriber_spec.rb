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

  describe '#name' do
    subject(:subscriber) { create(:subscriber) }

    it 'should return the full name' do
      expect(subscriber.full_name).to eq("#{subscriber.first_name} #{subscriber.last_name}")
    end
  end
end
