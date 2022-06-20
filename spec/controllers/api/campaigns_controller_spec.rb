require 'rails_helper'

describe Api::CampaignsController, type: :controller do
  describe 'GET show' do
    let!(:store) { create(:store) }
    let!(:subscriber) { create(:subscriber, store: store) }
    let!(:mailing) { create(:mailing, store: store) }

    it 'returns a status 200' do
      get :show, params: { id: mailing.id }

      hash_body = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(hash_body.keys).to match_array(%w[from html recipient_variables])
    end
  end
end
