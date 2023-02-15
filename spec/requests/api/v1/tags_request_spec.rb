require 'rails_helper'

RSpec.describe "Tags Request", type: :request do
  let(:role) { create(:role) }
  let(:permissions) { %w[ view_tag create_tag update_tag destroy_tag ] }
  let(:user) { create(:user, :with_role, role_name: role.name) }
  let(:headers) { valid_headers}
  let!(:tags) { create_list(:tag, 3) }
  let(:tag_id) { tags.first.id }

  before do
    permissions.each do |permission|
      create(:permission_role, role_id: role.id, permission: permission)
    end
  end

  describe "GET /tags" do
    before { get '/api/v1/tags', headers: headers }

    it "returns all tags" do
      expect(response_body.size).to eq(3)
    end

    it "return status code 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET /tags/:params" do
    let(:params) { tags.first.name }
    before { get "/api/v1/tags", params: { name: params }, headers: headers }

    it "return name" do
      expect(response_body[0]['attributes']['name']).to eq(params)
    end
  end

  describe "GET /tags/:id" do
    before  { get "/api/v1/tags/#{tag_id}", headers: headers }

    context "When the tag exist" do
      it "return the id" do
        expect(response_body['attributes']['id']).to eq(tag_id)
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
    let(:valid_attributes) { { name: "test", color: "#0000" }.to_json }
    before { post "/api/v1/tags", params: valid_attributes, headers: headers }

    context "When the request is valid" do
      it "return name" do
        expect(response_body['attributes']["name"]).to eq("test")
      end

      it "return status code 201" do
        expect(response.status).to eq(201)
      end
    end

    context "When the request is invalid" do
      let(:valid_attributes) { { name: "" }.to_json }
      before { post "/api/v1/tags", params: valid_attributes, headers: headers }
      it "return status code 422" do
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT /tags/:id" do
    let(:valid_attributes) { { name: "testing" }.to_json }
    before { put "/api/v1/tags/#{tag_id}", params: valid_attributes, headers: headers }

    context "When the request is valid" do

      it "return name" do
        expect(response_body['attributes']["name"]).to eq("testing")
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end

    context "When the request is invalid" do
      let(:valid_attributes) { { name: "" }.to_json }
      before { put "/api/v1/tags/#{tag_id}", params: valid_attributes, headers: headers }

      it "return status code 422" do
        expect(response.status).to eq(422)
      end
    end
  end

  # This test is for the DELETE '/route/:id' endpoint
  describe 'DELETE /tags/:id' do
    # Execute the DELETE request before running the test
    before { delete "/api/v1/tags/#{tag_id}", headers: headers }

    # Test that the response has a HTTP status code of 204
    it 'returns status code 204' do
      expect(response.status).to eq(204)
    end
  end
end
