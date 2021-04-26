class User < ApplicationRecord
  attr_accessor :reset_token
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :points, dependent: :destroy
  has_many :drillgroups, through: :points, source: :drillgroup
  validates(
      :email, 
      presence: true, 
      uniqueness: true,
      length: { maximum: 255 },
      format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
  )
  validates(:first_name, presence: true, length: { maximum: 25 }) 
  validates(:last_name, presence: true, length: { maximum: 25 }) 

  def total_points
    total = 0
    points.each do |point|
      total = total + point.drillgroup.value if point.score && point.score > 50
    end
    total
  end
# Returns true if the given token matches the digest.
def authenticated?(attribute, token)
  digest = send("#{attribute}_digest")
  return false if digest.nil?
  BCrypt::Password.new(digest).is_password?(token)
end



  def activate_account!   
    update_attribute :is_active, true 
  end
  
  def deactivate_account!   
    update_attribute :is_active, false 
  end



  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end


  # This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


  
  # Sets the password reset attributes.
 def create_reset_digest
  self.reset_token = User.new_token
  update_attribute(:reset_digest, User.digest(reset_token))
  update_attribute(:reset_sent_at, Time.zone.now)
end



# Sends password reset email.
def send_password_reset_email
  UserMailer.password_reset(self).deliver_now
end
# Returns true if a password reset has expired.
def password_reset_expired?
  reset_sent_at < 2.hours.ago
end

def full_name
  "#{first_name} #{last_name}".strip
end

# Returns the hash digest of the given string.
def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

# Returns a random token.
def User.new_token
  SecureRandom.urlsafe_base64
end



  private

  # def generate_token
  #   SecureRandom.hex(10)
  #  end

  
end
