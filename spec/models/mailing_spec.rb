# == Schema Information
#
# Table name: mailings
#
#  id         :bigint           not null, primary key
#  from       :string
#  html       :text
#  subject    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :integer
#
# Indexes
#
#  index_mailings_on_store_id  (store_id)
#
require 'rails_helper'

describe Mailing, type: :model do
  context 'associations' do
    it { should belong_to(:store) }
  end

  context 'validations' do
    it { should validate_presence_of(:from) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:html) }
  end
end
