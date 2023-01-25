require 'rails_helper'

RSpec.describe AuthorizedApiRequest do
  let(:user) { create(:user) }

  let(:headers) { { Authorization: token_generator(user.id) } }

  subject(:invalid_request_object) { described_class.new({}) }
  subject(:request_object) { described_class.new(headers) }

  describe "#call" do
    context "When the request is valid" do
      it "return user object" do
        result = request_object.call
        expect(result[:user]).to eq(user)
      end

      context "When the request is invalid" do
        context "when missing token" do
          it "raises a MissingToken exception" do
            expect { invalid_request_object.call }.to raise_error(ExceptionHandler::MissingToken, "Missing token")
          end
        end

        context "when token is expired" do
          let(:headers) { { Authorization: expired_token_generator(user.id) } }
          let(:request_object) { described_class.new(headers) }

          it "raises an Expired token" do
            expect { request_object.call }.to raise_error(ExceptionHandler::InvalidToken, "Sorry your token has expired")
          end
        end

        # context "When invalid token" do
         # let(:headers) { { Authorization: "555" } }
         # subject(:invalid_request_object) { described_class.new(headers) }

         # it "raises a InvalidToken exception" do
          #  expect { invalid_request_object.call }.to raise_error(ExceptionHandler::InvalidToken, "Invalid token")
          #end
        # end
      end
    end
  end
end
