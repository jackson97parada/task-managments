require "rails_helper"

RSpec.describe UserWelcomeMailer, type: :mailer do
  describe "#welcome" do
    let(:user) { create(:user) }
    let(:mail) { described_class.with(user: user).welcome }

    it "send an emails to the right recipent" do
      expect { mail.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
      expect(mail.to).to eq [user.email]
    end
  end
end
