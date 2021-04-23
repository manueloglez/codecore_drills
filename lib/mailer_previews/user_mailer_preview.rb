class UserMailerPreview < ActionMailer::Preview
    def welcome_email
      UserMailer.with(user: User.first).welcome_email
    end

  #   # Preview this email at
  # # http://localhost:3000/rails/mailers/user_mailer/account_activation
  # def account_activation
  #   user = User.last
  #   user.activation_token = User.new_token
  #   UserMailer.account_activation(user)
  # end

    # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.find_by(params[:email])
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end

end
  