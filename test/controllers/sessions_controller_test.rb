require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup 
    @user = users(:admin)
  end 
  
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should login" do 
    get login_path 
    assert_response :success
    post login_path, params: { session: { email: @user.email, password: 'password1' } }
    assert_response :redirect
    follow_redirect! 
    assert is_logged_in?
    assert_response :success
    assert_select "h1", "Immigration Rights Hotline Script"
  end 

  test "should logout" do 
    get login_path 
    assert_response :success
    post login_path, params: { session: { email: @user.email, password: 'password1' } }
    assert_response :redirect
    follow_redirect! 
    assert is_logged_in?
    delete logout_path 
    assert_not is_logged_in?
    assert_response :redirect
    follow_redirect!
    assert_select "a[href=?]", login_path
  end 

end
