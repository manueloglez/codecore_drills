class User < ApplicationRecord

  before_save :downcase_email
  has_secure_password


  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
  end
  # This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  


  # # Sends activation email.
  # def send_activation_email
  #   UserMailer.account_activation(self).deliver_now
  # end

      #  # Activates an account.
      #  def activate
      #   update_columns(activated: true, activated_at: Time.zone.now)
      # end

      # def deactivate
      #   update_columns(activated: false, activated_at: Time.zone.now)
      # end
        


   
   
 

    validates(
        :email, 
        presence: true, 
        uniqueness: true,
        length: { maximum: 255 },
        format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      )
      validates(:first_name, presence: true, length: { maximum: 25 }) 
      validates(:last_name, presence: true, length: { maximum: 25 }) 
    
      def full_name
        "#{first_name} #{last_name}".strip
      end

      private

      

    #   # Creates and assigns the activation token and digest.
    # def create_activation_digest
    #   self.activation_token  = User.new_token
    #   self.activation_digest = User.digest(activation_token)
    # end

   # Converts email to all lowercase.
   def downcase_email
     self.email = email.downcase
   end

end
