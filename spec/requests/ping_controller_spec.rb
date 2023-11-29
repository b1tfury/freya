require 'rails_helper'

RSpec.describe 'Ping', type: :request do
  describe 'GET /ping' do
    it 'returns a 200 OK status' do
      get '/ping'
      expect(response).to have_http_status(200)
    end

    it 'returns a JSON response' do
      get '/ping'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns a message' do
      get '/ping'
      expect(JSON.parse(response.body)['message']).to eq('Pong')
    end
  end
end