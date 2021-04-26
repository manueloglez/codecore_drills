class Point < ApplicationRecord
  belongs_to :user
  belongs_to :drillgroup

  validates :score, numericality: {
    less_than_or_equal_to: 100,
    greater_than_or_equal_to: 0,
    allow_nil: true
  }

  validates :taken, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :drillgroup_id, uniqueness: {scope: :user_id}
end
