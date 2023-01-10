require 'rails_helper'

RSpec.describe "Enterprises Request", type: :request do
  #carga perezosa y no perezosa
  #given
  let!(:enterprises) { create_list(:enterprise, 3) }
  let(:enterprise_id) { enterprises.first.id }
  describe "GET /enterprises" do
    #when
    before { get '/enterprises' }
    it "returns all enterprises" do
      # binding.break
      #Then
      expect(response_body.size).to eq(3)
    end

    it "return status code 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET /enterprises/:id" do
    before  { get "/enterprises/#{enterprise_id}" }

    context "When the enterprise exist" do
      it "return the id" do
        expect(response_body['id']).to eq(enterprise_id)
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end
    # binding.break
    context "When the enterprise does not exist" do
      let(:enterprise_id) { -1 }

      it "return status code 404" do
        expect(response.status).to eq(404)
      end
    end
  end

  # This test is for the DELETE '/route/:id' endpoint
  describe 'DELETE /enterprises/:id' do
    # Execute the DELETE request before running the test
    before { delete "/enterprises/#{enterprise_id}" }

    # Test that the response has a HTTP status code of 204
    it 'returns status code 204' do
      expect(response.status).to eq(204)
    end
  end
end