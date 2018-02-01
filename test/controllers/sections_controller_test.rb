require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @section = Section.first 
  end 

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
    post sections_path, params: {"section" => { title: "section title", 
                                                body: "lorem text", 
                                                sub_sections_attributes: [title: "Subsection Title", 
                                                                          body: "more lorem text"], 
                                                links_attributes: [option: "section title"]}}, xhr: true 
    assert_not flash.empty?
    assert_response :success 
    assert_match "section title", Section.last.title 
    assert_match "lorem text", Section.last.body
    assert_match "Subsection Title", Section.last.sub_sections.first.title 
    assert_match "more lorem text", Section.last.sub_sections.first.body
    assert_match "section title", Section.last.links.first.option
  end 

 test "volunteer should not post new section" do 
    log_in_as_volunteer
    post sections_path, params: {"section" => { title: "section title", body: "lorem text", sub_sections_attributes: [title: "Subsection Title", body: "more lorem text"], links_attributes: [option: "section title"]}}, xhr: true 
    assert_no_match "section title", Section.last.title   
  end

  test "should patch edit" do 
    log_in_as_editor 
    patch sections_path(:section_id => @section.id), params: {"section" => { title: "section title", 
                                                    body: "lorem text", 
                                                    sub_sections_attributes: [title: "Subsection Title", body: "more lorem text"], 
                                                    links_attributes: [option: "MyText"]}}, xhr: true 
    assert_response :success
    assert_equal "Saved Successfully", flash[:success]
    #assert_equal "Error: Update Failed", flash[:notice]
    assert_match "section title", Section.first.title 
    assert_match "lorem text", Section.first.body
    assert_match "Subsection Title", Section.first.sub_sections.first.title 
    assert_match "more lorem text", Section.first.sub_sections.first.body
    assert_match "section title", Section.first.links.first.option
  end 

end







