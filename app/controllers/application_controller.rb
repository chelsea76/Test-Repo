class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    current_user.role_type == "Admin" ? invite_writer_path : Writer.find(current_user.role_id)
  end
  
end
