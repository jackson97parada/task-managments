require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'validations' do
    subject { build.(:employee) }

    it { validate_presence_of(:name) }

    it { validate_presence_of(:last_name) }

    it { validate_presence_of(:document) }

    it { validate_presence_of(:mobile) }
  end
end