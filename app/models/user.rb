class User < ApplicationRecord
  before_save { self.email = email.downcase }
    has_secure_password





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
end
