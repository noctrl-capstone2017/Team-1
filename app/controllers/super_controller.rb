class SuperController < ApplicationController
    
  def index
  end

  #Robert H
  # Confirms an admin user.
  def admin_user
      redirect_to(root_url) unless current_user.admin_powers?
  end
end


