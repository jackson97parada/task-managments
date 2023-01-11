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

  describe "POST /tags" do
    let(:valid_attributes) { { tag: { name: "test", color: "#0000" } } }
    before { post "/tags", params: valid_attributes }

    context "When the request is valid" do
      it "return name" do
        expect(response_body["name"]).to eq("test")
      end

      it "return status code 201" do
        expect(response.status).to eq(201)
      end
    end

    context "When the request is invalid" do
      let(:valid_attributes) { { tag: { name: "" } } }
      before { post "/tags", params: valid_attributes }
      it "return status code 422" do
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT /tags/:id" do
    let(:valid_attributes) { { tag: { name: "testing" } } }
    before { put "/tags/#{tag_id}", params: valid_attributes }

    context "When the request is valid" do
      
      it "return name" do
        expect(response_body["name"]).to eq("testing")
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end

    context "When the request is invalid" do
      let(:valid_attributes) { { tag: { name: "" } } }
      before { put "/tags/#{tag_id}", params: valid_attributes }

      it "return status code 422" do
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT /tags/:id/update_enabled" do
    before { put "/tags/#{tag_id}/update_enabled" }

    context "When the tag exist" do
      it "return the id" do
        expect(response_body['id']).to eq(tag_id)
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end
    context "When the tag don't exist" do
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