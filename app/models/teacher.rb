#author: Tommy Banas

class Teacher < ApplicationRecord
    has_many :active_relationships, class_name:  "RosterStudent",
                                    foreign_key: "teacher_id",
                                    dependent:   :destroy
    
    has_many :students, through: :active_relationships, source: :student
end
