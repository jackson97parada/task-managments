class UserWelcomeMailer < ApplicationMailer

  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: "Your is more the beautiful")
  end
end
