# Michael Loptien

class Square < ApplicationRecord

  #Creates the relationship of what teachers the student belongs too
    has_many :passive_relationships, class_name:  "RosterSquare",
                                     foreign_key: "square_id",
                                     dependent:   :destroy
    has_many :students, through: :passive_relationships, source: :student
  # Ensures that none of the fields are empty
  validates :square_id, presence: true
  validates :square_type, presence: true
  validates :color, presence: true
  validates :square_description, presence: true
end
