require 'rails_helper'

RSpec.describe 'Auth Request', type: :request do
  describe 'POST auth/login' do
    let!(:user) { create(:user) }

    let(:valid_credentials) do
      {
        email: user.email,
        password: user.password
      }
    end

    let(:invalid_credentials) do
      {
        email: 'tetestes@gmail.com',
        password: 'test'
      }
    end

    context 'When the request is valid' do
      before { post '/auth/login', params: valid_credentials }

      it 'return an authentication token' do
        expect(auth_response_body['token']).not_to be_nil
      end
    end

    context 'When the request is invalid' do
      before { post '/auth/login', params: invalid_credentials }

      it 'return a failure message' do
        expect(auth_response_body['message']).to match(/Email or password incorrect/)
      end
    end
  end
end
