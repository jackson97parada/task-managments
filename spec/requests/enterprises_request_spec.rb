require 'rails_helper'

RSpec.describe "Enterprises Request", type: :request do
  #carga perezosa y no perezosa
  let!(:enterprises) { create_list(:enterprise, 3) }
  #given
  describe "GET /enterprises" do
    it "returns all enterprises" do
      #when
      get '/enterprises'
      # binding.break
      #Then
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
end