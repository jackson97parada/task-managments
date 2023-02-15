require 'rails_helper'

RSpec.describe Employee, type: :model do

  describe 'associations' do
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    subject { build(:employee) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:last_name) }

    it { should validate_presence_of(:document) }

    it { should validate_presence_of(:mobile) }
  end
end
