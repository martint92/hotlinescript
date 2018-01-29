class SectionsController < ApplicationController
  def new
    @sections = Section.all 
    @section = Section.new 
    @section.sub_sections.build 
    @section.links.build 
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      flash[:notice] = "Saved Successfully"
    else 
      flash[:notice] = "Error: Save Failed"
    end 
    @selected ||= Section.last
    render 'index'
  end 
      
  def index 
    @sections = Section.all 
    @selected ||= Section.find(1) 
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

  def edit
    @section = Section.find(params[:id])
  end

  def update 
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Saved Successfully"
      render 'index'
    else 
      flash[:notice] = "Error: Update Failed"
      render 'edit'
    end 
  end 

  def destroy 
    @section = Section.find(params[:id]).destroy 
  end 

  private 
    def section_params
      params.require(:section).permit(:title, :body, sub_sections_attributes: [:id, :title, :body, :_destroy], links_attributes: [:id, :option, :_destroy])
    end 
end
