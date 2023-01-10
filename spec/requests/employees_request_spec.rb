require 'rails_helper'

RSpec.describe "Employees Request", type: :request do
  let!(:employees) { create_list(:employee, 3) }
  let(:employee_id) { employees.first.id }
  
  describe "GET /employees" do
    before { get '/employees' }

    it "returns all employees" do      
      expect(response_body.size).to eq(3)
    end

    it "return status code 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET /employees/:id" do
    before  { get "/employees/#{employee_id}" }

    context "When the employee exist" do
      it "return the id" do
        expect(response_body['id']).to eq(employee_id)
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

  # This test is for the DELETE '/route/:id' endpoint
  describe 'DELETE /employees/:id' do
    # Execute the DELETE request before running the test
    before { delete "/employees/#{employee_id}" }

    # Test that the response has a HTTP status code of 204
    it 'returns status code 204' do
      expect(response.status).to eq(204)
    end
  end
end