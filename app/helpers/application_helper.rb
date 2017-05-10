# Application Helper
# Fills an array with all student art, gets a random image
# Team 1
# Author: Meagan Moore
# Strategy credit: GiftGarden Capstone Fall 2016

module ApplicationHelper
  
  # Returns random artwork path
  def random_student_art
    images = [ "student_art/art1_jimmy.jpg", "student_art/art2_janey.jpg", 
          "student_art/art3_fred.jpg", "student_art/art4_trudy.jpg" ]
    images[rand(images.size)]
  end
  

end
