require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get Home" do
    get @home
    assert_response :success
  end

  test "should get Maintenance" do
    get @maintenance
    assert_response :success
  end

  test "should get PermissionError" do
    get @permissionError
    assert_response :success
  end

  test "should get Contact" do
    get @contact
    assert_response :success
  end

end
