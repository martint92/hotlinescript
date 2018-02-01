class SectionsController < ApplicationController
  
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
    @section.sub_sections.build 
    @section.links.build 
    respond_to do |format|
      format.js 
      format.html
    end
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      flash[:success] = "Saved Successfully"
    else 
      flash[:notice] = "Error: Save Failed"
    end 
    @selected ||= Section.last
    redirect_to sections_index_path
  end 

  def edit
    @section = Section.find(params[:id])
    respond_to do |format|
      format.js
      format.html
    end 
  end

  def update 
    begin
      @section = Section.find(params[:id])
    rescue 
      @section = Section.where(:id => params[:section_id]).first
    end
    if @section.update_attributes(section_params)
      flash[:success] = "Saved Successfully"
      redirect_to sections_index_path
    else 
      flash[:notice] = "Error: Update Failed"
      redirect_to sections_index_path
    end 
  end 

  def destroy 
    @section = Section.find(params[:id]).destroy 
    redirect_to sections_index_path
  end 

  private 
    def section_params
      params.require(:section).permit(:title, :body, 
      sub_sections_attributes: [:id, :title, :body, :_destroy], 
      links_attributes: [:id, :option, :_destroy])
    end 
end
