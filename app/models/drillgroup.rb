class Drillgroup < ApplicationRecord
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
  
  validates(
    :level,
    presence: {
      message: "must select a level"
    },
  )
end
