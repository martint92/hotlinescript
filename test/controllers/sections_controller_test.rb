require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sections_new_url
    assert_response :success
  end

  test "should get index" do
    get sections_index_url
    assert_response :success
  end

  test "should get edit" do
    get sections_edit_url
    assert_response :success
  end

end