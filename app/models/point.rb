class Point < ApplicationRecord
  belongs_to :user
  belongs_to :drillgroup

  validates :value, numericality: { greater_than_or_equal_to: 0 }
  validates :score, numericality: {
    less_than_or_equal_to: 100,
    greater_than_or_equal_to: 0
  }

  validates :taken, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :drillgroup_id, uniqueness: {scope: :user_id}
end
