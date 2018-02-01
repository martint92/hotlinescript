require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as_admin
    post login_path, params: { session: { email: 'admin@email.com', password: 'password1' } }
    assert_response :redirect
    follow_redirect! 
    assert is_logged_in?
  end 

  def log_in_as_editor
    post login_path, params: { session: { email: 'editor@email.com', password: 'password1' } }
    assert_response :redirect
    follow_redirect! 
    assert is_logged_in?
  end 

  def log_in_as_volunteer
    post login_path, params: { session: { email: 'volunteer@email.com', password: 'password1' } }
    assert_response :redirect
    follow_redirect! 
    assert is_logged_in?
  end 
end