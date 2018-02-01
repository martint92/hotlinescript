require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    log_in_as_admin
    get sections_index_path
    assert_response :success
  end

  test "should get new" do 
    log_in_as_admin
    get new_section_path, xhr: true 
    assert_equal "text/javascript", response.content_type
  end 

  test "should post new section" do 
    log_in_as_admin
    post sections_path, params: {"section" => { title: "section title", body: "lorem text", sub_sections_attributes: [title: "Subsection Title", body: "more lorem text"], links_attributes: [option: "section title"]}}, xhr: true 
    assert_not flash.empty?
    assert_response :success 
    assert_match "section title", Section.last.title 
  end 

 test "volunteer should not post new section" do 
    log_in_as_volunteer
    post sections_path, params: {"section" => { title: "section title", body: "lorem text", sub_sections_attributes: [title: "Subsection Title", body: "more lorem text"], links_attributes: [option: "section title"]}}, xhr: true 
    assert_no_match "section title", Section.last.title   
  end

end
