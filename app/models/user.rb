class User < ApplicationRecord
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

  def activate_account!   
    update_attribute :is_active, true 
  end
  
  def deactivate_account!   
    update_attribute :is_active, false 
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
