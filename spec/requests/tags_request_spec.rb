require 'rails_helper'

RSpec.describe "Tags Request", type: :request do
  let!(:tags) { create_list(:tag, 3) }
  describe "GET /tags" do
    it "returns all tags" do
      get '/tags'
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
end