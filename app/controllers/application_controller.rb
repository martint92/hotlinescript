class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :can_edit?
  helper_method :is_admin?
        
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def can_edit?
    case current_user.role
    when "admin" then true 
    when "editor" then true 
    when "volunteer" then false
    else 
      false 
    end 
  end 

  def is_admin?
    current_user.role == 'admin' ? true : false 
  end 
  
  def require_user
    redirect_to '/error' unless current_user
  end
  
  def require_admin
    redirect_to '/error' unless current_user && current_user.role == 'admin' 
  end
    
  def require_editor
    redirect_to '/error' unless can_edit?
  end 
end
