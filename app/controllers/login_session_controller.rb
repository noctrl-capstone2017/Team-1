# Login Session Controller
# Finish log in & log out
# Team 1
# By: Meagan Moore

class LoginSessionController < ApplicationController

  # login page
  def new
  end
  
  

  # logs in the teacher if successful, flashes a danger if invalid log in info
  def create
    teacher = Teacher.find_by(:user_name => params[:session][:user_name].downcase)
    if teacher && teacher.authenticate(params[:session][:password])
      log_in teacher
      params[:session][:remember_me] == '1' ? remember(teacher) : forget(teacher)
      redirect_to home1_path
      
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
    
  end

  # logout page
  def logout
      log_out if logged_in?
  end
  
end
