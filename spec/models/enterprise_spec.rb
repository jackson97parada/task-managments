require 'rails_helper'

RSpec.describe Enterprise, type: :model do

  describe 'validations' do
    subject  { build(:enterprise) }

    it { should validate_presence_of(:nit) }
    it { should validate_uniqueness_of(:nit).ignoring_case_sensitivity }

    it { should validate_presence_of(:address) }

    it { should validate_presence_of(:mobile) }
    it { should validate_uniqueness_of(:mobile).ignoring_case_sensitivity }
  end
end
