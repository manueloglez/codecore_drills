class Answer < ApplicationRecord
  belongs_to :drill
  validates :description, presence: true
end
