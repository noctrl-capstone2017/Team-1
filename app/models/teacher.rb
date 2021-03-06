#author: Tommy Banas

#extra notes for Tommy B:
#   rails server -b $IP -p $PORT

class Teacher < ApplicationRecord
  
  # Create an accessible attribute
  # author: Meagan Moore
  attr_accessor :remember_token
  
  validates :user_name,  presence: true, length: { maximum: 75 }
  validates :teacher_icon_name,  presence: true, length: { maximum: 15 }
  validates :teacher_name, presence: true, length: { maximum: 75 }
  validates :teacher_email, presence: true, length: { maximum: 255 }
  validates :teacher_description, presence: true
  validates :color, presence: true
  validates :teacher_password, presence: true, length: { minimum: 6 }, allow_nil: true
  # the password confirmation is not implemented
  #validates :teacher_password_confirmation, presence: true, length: { minimum: 6 }, allow_nil: true


  #Creates the relationship of what students belong to the teacher
  #author Matthew OBzera
  has_many :active_relationships, class_name:  "RosterStudent",
                                  foreign_key: "teacher_id",
                                  dependent:   :destroy

  has_many :students, through: :active_relationships, source: :student
  
  # Returns the hash digest of the given string.
  # author: Meagan Moore
  def Teacher.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token for remembering users
  # author: Meagan Moore
  def Teacher.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Remembers a teacher in the database for use in persistent sessions.
  # author: Meagan Moore
  def remember
    self.remember_token = Teacher.new_token
    update_attribute(:remember_digest, Teacher.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  # author: Meagan Moore
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
end
