# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /login' do
    it 'returns http success' do
      get '/homes/login'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /newsfeed' do
    it 'returns http success' do
      get '/homes/newsfeed'
      expect(response).to have_http_status(:success)
    end
  end
end
