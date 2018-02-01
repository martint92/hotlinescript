require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get '/'
    assert_response :success
  end 

  test "should get permission error" do 
    get '/sections'
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Permission Error"
  end 

  test "should get help" do 
    get '/help'
    assert_response :success 
  end 

  test "should get maintenance" do 
    get '/maintenance'
    assert_response :success
  end 

end
