class Drillgroup < ApplicationRecord
  has_many :drills, dependent: :destroy
  has_many :users, through: :points
  has_many :points, dependent: :destroy
  validates(
    :title,
    presence: true,
    uniqueness: true
  )

  validates(
    :description,
    presence: {
      message: "must include a question"
    },
    length: {
      minimum: 10
    },
  )

  validates(
    :level,
    presence: {
      message: "must select a level"
    },
  )
  
end
