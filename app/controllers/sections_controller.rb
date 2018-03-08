class SectionsController < ApplicationController
  include SectionsHelper
  
  before_action :require_editor, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_user

  def index 
    @sections = Section.all 
    @selected ||= Section.first
    @hotlinks = Hotlink.all 
    respond_to do |format|
      format.js
      format.html
    end 
  end

  def from_sections
    @selected = Section.where(:id => params[:section_id]).first
    respond_to do |format|
      format.js
    end 
    @selected = Section.where(:title => params[:section_title]).first if @selected.nil?
  end 

  def show
    @selected = Section.first
    redirect_to section_index_path
  end 
  
  def new
    @sections = Section.all 
    @section = Section.new 
    respond_to do |format|
      format.js 
    end
  end

  def create
    @section = Section.create(section_params)
    @selected = Topic.last
    @topics = Topic.order(:priority).all 
    respond_to(:js)
  end 

  def edit
    @section = Section.find(params[:id])
    @section.sub_sections.build unless @section.sub_sections.any?
    respond_to :js 
  end

  def update 
    @selected = Topic.last 
    begin
      @section = Section.find(params[:id])
    rescue 
      @section = Section.find(params[:section_id])
    end
    @section.update_attributes(section_params)
    respond_to :js, :html
  end 

  def destroy 
    @topics = Topic.order(:priority).all 
    @selected ||= Topic.first 
    @section = Section.find(params[:id]).destroy 
    respond_to(:js)
  end 

  private 
    def section_params
      params.require(:section).permit(:title, :body, :topic_id,
      sub_sections_attributes: [:id, :title, :body, :_destroy,
      micro_sections_attributes: [:id, :title, :body, :_destroy]])
    end 
end
