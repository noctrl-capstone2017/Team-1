# Michael Loptien

class Square < ApplicationRecord
  # Ensures that none of the fields are empty
  validates :square_id, presence: true
  validates :square_type, presence: true
  validates :color, presence: true
  validates :square_description, presence: true
end
