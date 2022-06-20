require 'rails_helper'

describe MailingSerializer do
  describe '#campaign_data' do
    let!(:store) { create(:store) }
    let!(:subscriber) { create(:subscriber, store: store) }
    let!(:mailing) { create(:mailing, store: store) }

    subject(:serializer) { MailingSerializer.new(mailing) }

    it 'returns the hash for recipients or subscribers' do
      expect(serializer.campaign_data).to include(
        { from: mailing.from }
      )

      expect(serializer.campaign_data).to include(
        { html: mailing.html }
      )
    end

    it 'returns the recipient_variables' do
      recipient = mailing.store.subscribers.first
      recipient_variables = serializer.campaign_data[:recipient_variables][:"#{recipient.email}"]

      expect(serializer.campaign_data[:recipient_variables].keys).to include(:"#{recipient.email}")

      expect(recipient_variables).to include(
        { store_name: '' }
      )

      expect(recipient_variables).to include(
        { name: recipient.full_name }
      )

      expect(recipient_variables).to include(
        {
          last_order_amount: {
            fallback: '0'
          }
        }
      )
    end
  end
end
