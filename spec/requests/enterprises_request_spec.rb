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

  #Test for POST /enterprises for create enterprises
  describe "POST /enterprises" do
    let(:valid_attributes) { { enterprise: { nit: "202020", address: "san lukas", mobile: "12321" } } }
    before { post "/enterprises", params: valid_attributes }

    context "When the request is valid" do
      it "return nit" do
        expect(response_body["nit"]).to eq("202020")
      end
      
      it "return status code 201" do
        expect(response.status).to eq(201)
      end
    end

    context "When the request is valid" do
      let(:valid_attributes) { { enterprise: { nit: "" } } }
      before { post "/enterprises", params: valid_attributes }
      it "return status code 422" do
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT /enterprises/:id" do
    let(:valid_attributes) { { enterprise: { nit: "222222" } } }
    before { put "/enterprises/#{enterprise_id}", params: valid_attributes }
    
    context "When the request is valid" do
      
      it "return nit" do
        expect(response_body["nit"]).to eq("222222")
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end

    context "When the request is invalid" do
      let(:valid_attributes) { { enterprise: { nit: "" } } }
      before { put "/enterprises/#{enterprise_id}", params: valid_attributes }

      it "return status code 422" do
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT /enterprises/:id/update_enabled" do
    before { put "/enterprises/#{enterprise_id}/update_enabled" }

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