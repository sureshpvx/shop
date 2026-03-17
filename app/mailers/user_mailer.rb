class UserMailer < ApplicationMailer
  default from: "sureshsharma46058@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to VShop 🎉")
  end
end