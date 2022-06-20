require 'rails_helper'

describe 'Mail', type: :request do
  describe 'POST /send_email' do
    it 'returns http success' do
      get '/api/campaigns/:id'

      expect(response).to have_http_status(:success)
    end
  end
end
