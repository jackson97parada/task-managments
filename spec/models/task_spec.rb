require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "enums" do
    it { should define_enum_for(:status).with_values({ actived: 0, disabled: 1 }) }
  end

  describe 'association' do
    it { should belong_to(:tag) }
    it { should have_many(:employees).through(:task_assignments) }
  end

  describe 'validations' do
    subject { build(:task) }

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:start_date) }
    
    it { should validate_presence_of(:end_date) }
    
  end
end