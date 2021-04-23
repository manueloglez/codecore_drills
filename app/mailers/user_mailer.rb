class UserMailer < ApplicationMailer
  default from: 'noreply@codecoredrills.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://codecoredrills.com/login'
    mail(to: email_address_with_full_name(@user.email, @user.full_name),subject:'Welcome to Codecore drills')
  end

  # def account_activation(user)
  #   @user = user
  #   mail(to: @user.email, subject: "Account activation")
  # end
  def forgot_password(user)
    @user = user
    @greeting = "Hi"
    
    mail to: user.email, :subject => 'Reset password instructions'
  end
