#author: Tommy Banas

class Teacher < ApplicationRecord
<<<<<<< HEAD
    has_many :active_relationships, class_name:  "RosterStudent",
                                    foreign_key: "teacher_id",
                                    dependent:   :destroy
    
    has_many :students, through: :active_relationships, source: :student
=======
  
  
>>>>>>> 2af8f4977e2f2ade1be3ad1d006a6baec9081a89
end
