class Drillgroup < ApplicationRecord
  has_many :drills, dependent: :destroy
  has_many :points, dependent: :destroy
  has_many :users, through: :points
  # validates :value, numericality: { greater_than_or_equal_to: 0 }

  # validates(
  #   :title,
  #   presence: true,
  # )

  # validates(
  #   :description,
  #   presence: {
  #     message: "must include a description"
  #   },
  #   length: {
  #     minimum: 10
  #   },
  # )

  # validates(
  #   :value,
  #   presence: {
  #     message: "must select a level"
  #   },
  # )
  
end
