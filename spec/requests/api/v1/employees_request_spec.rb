require 'rails_helper'

RSpec.describe "Employees Request", type: :request do
  let(:role) { create(:role) }
  let(:permissions) { %w[ view_employee create_employee update_employee destroy_employee ] }
  let(:user) { create(:user, :with_role, role_name: role.name) }
  let(:headers) { valid_headers }
  let!(:employees) { create_list(:employee, 3, user_id: user.id) }
  let(:employee_id) { employees.first.id }

  before do
    permissions.each do |permission|
      create(:permission_role, role_id: role.id, permission: permission)
    end
  end

  describe "GET /employees" do
    before { get '/api/v1/employees', headers: headers }
    it "returns all employees" do
      expect(response_body.size).to eq(3)
    end

    it "return status code 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET /employees/:id" do
    before  { get "/api/v1/employees/#{employee_id}", headers: headers }

    context "When the employee exist" do
      it "return the id" do
        expect(response_body['attributes']['id']).to eq(employee_id)
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end
    # binding.break
    context "When the employee does not exist" do
      let(:employee_id) { -1 }

      it "return status code 404" do
        expect(response.status).to eq(404)
      end
    end
  end

  describe "POST /employees" do
    let(:valid_attributes) { { name: "test", last_name: "test2", document: "222222", mobile: "111111", salary: 12.12, user_id: user.id }.to_json }
    before { post "/api/v1/employees", params: valid_attributes, headers: headers }

    context "When the request is valid" do

      it "return name" do
        expect(response_body['attributes']["name"]).to eq("test")
      end

      it "return status code 201" do
        expect(response.status).to eq(201)
      end
    end

    context "Whe the request is invalid" do
      let(:valid_attributes) { { name: "" }.to_json }
      before { post "/api/v1/employees", params: valid_attributes, headers: headers }

      it "return status code 422" do
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT /employees/:id" do
    let(:valid_attributes) {  { name: "testing" }.to_json }
    before { put "/api/v1/employees/#{employee_id}", params: valid_attributes, headers: headers }

    context "When the request is valid" do

      it "return name" do
        expect(response_body['attributes']["name"]).to eq("testing")
      end

      it "return status code 200" do
        expect(response.status).to eq(200)
      end
    end

    context "Whe the request is invalid" do
      let(:valid_attributes) { { name: "" }.to_json }
      before { put "/api/v1/employees/#{employee_id}", params: valid_attributes, headers: headers }

      it "return status code 422" do
        expect(response.status).to eq(422)
      end
    end

  end

  # This test is for the DELETE '/route/:id' endpoint
  describe 'DELETE /employees/:id' do
    # Execute the DELETE request before running the test
    before { delete "/api/v1/employees/#{employee_id}", headers: headers }

    # Test that the response has a HTTP status code of 204
    it 'returns status code 204' do
      expect(response.status).to eq(204)
    end
  end
end
