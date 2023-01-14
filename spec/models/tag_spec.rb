require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "associations" do
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    subject { build(:tag) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    
  end
end