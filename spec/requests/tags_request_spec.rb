require 'rails_helper'

RSpec.describe "Tags Request", type: :request do
  let!(:tags) { create_list(:tag, 3) }
  let(:tag_id) { tags.first.id }

  describe "GET /tags" do
    before { get '/tags' }

    it "returns all tags" do      
      expect(response_body.size).to eq(3)
    end

    it "return status code 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET /tags/:id" do
    before  { get "/tags/#{tag_id}" }

    context "When the tag exist" do
      it "return the id" do
        expect(response_body['id']).to eq(tag_id)
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end

    context "When the tag does not exist" do
      let(:tag_id) { -1 }

      it "return status code 404" do
        expect(response.status).to eq(404)
      end
    end
  end

  # This test is for the DELETE '/route/:id' endpoint
  describe 'DELETE /tags/:id' do
    # Execute the DELETE request before running the test
    before { delete "/tags/#{tag_id}" }

    # Test that the response has a HTTP status code of 204
    it 'returns status code 204' do
      expect(response.status).to eq(204)
    end
  end
end