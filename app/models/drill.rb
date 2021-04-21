class Drill < ApplicationRecord
  has_many :answers
  validates :description, presence: true
  accepts_nested_attributes_for :answers
end
