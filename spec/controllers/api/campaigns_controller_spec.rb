require 'rails_helper'

describe Api::CampaignsController, type: :controller do
  describe 'GET show' do
    let!(:mailing) { create(:mailing) }

    it 'returns a status 200' do
      get :show, params: { id: mailing.id }

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('{}')
    end
  end
end
