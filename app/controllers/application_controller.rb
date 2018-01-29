class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  helper_method :current_user
        
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def require_user
    redirect_to '/error' unless current_user
  end
  
  def require_admin
    redirect_to '/error' unless current_user && current_user.admin?
  end
    
  def require_editor
    redirect_to '/error' unless current_user && (current_user.editor? || current_user.admin?)
  end 
end
