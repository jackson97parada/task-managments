require 'rails_helper'

RSpec.describe AuthenticationUser do
  let(:user) { create(:user) }

  subject(:validate_auth) { described_class.new(user.email, user.password) }
  subject(:invalid_auth) { described_class.new("test@test.com", "test123") }

  describe "#call" do
    context "When valid credentials are" do
      it "return token" do
        token = validate_auth.call
        expect(token).not_to be_nil
      end
    end

    context "When invalid credentials are" do
      it "raises an AuthenticationError " do
        expect { invalid_auth.call }.to raise_error(ExceptionHandler::AuthenticationError), "Email or password incorrect"
      end
    end
  end
end
