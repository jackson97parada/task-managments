require 'rails_helper'

RSpec.describe "Employees Request", type: :request do
  let!(:employees) { create_list(:employee, 3) }
  describe "GET /employees" do
    it "returns all employees" do
      get '/employees'
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
end