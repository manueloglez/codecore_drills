class Drill < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :drillgroup
  validates :description, presence: true
  accepts_nested_attributes_for :answers
end
