require 'rails_helper'

describe MailingSerializer do
  describe '#subscribers_info' do
    let!(:mailing) { create(:mailing) }
    subject(:serializer) { MailingSerializer.new(mailing) }

    it 'returns the hash for recipients or subscribers' do
      expect(serializer.campaign_data).to include(
        { from: mailing.from }
      )

      expect(serializer.campaign_data).to include(
        { html: mailing.html }
      )
    end
  end
end
