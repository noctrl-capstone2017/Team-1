class Student < ApplicationRecord
  validates :student_name, presence: true
  validates :student_icon_name, presence: true
  validates :student_description, presence: true
  validates :color, presence: true
  validates :student_icon, presence: true
end
