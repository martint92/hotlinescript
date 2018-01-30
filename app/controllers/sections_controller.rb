class SectionsController < ApplicationController
  def new
    @sections = Section.all 
    @section = Section.new 
    @section.sub_sections.build 
    @section.links.build 
    respond_to do |format|
      format.js 
    end
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      flash[:notice] = "Saved Successfully"
    else 
      flash[:notice] = "Error: Save Failed"
    end 
    @selected ||= Section.last
    redirect_to '/'
  end 
      
  def index 
    @sections = Section.all 
    @selected ||= Section.first
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
    redirect_to '/'
  end 

  def edit
    @section = Section.find(params[:id])
    respond_to do |format|
      format.js
    end 
  end

  def update 
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Saved Successfully"
      redirect_to '/'
    else 
      flash[:notice] = "Error: Update Failed"
      redirect_to '/'
    end 
  end 

  def destroy 
    @section = Section.find(params[:id]).destroy 
    redirect_to "/"
  end 

  private 
    def section_params
      params.require(:section).permit(:title, :body, sub_sections_attributes: [:id, :title, :body, :_destroy], links_attributes: [:id, :option, :_destroy])
    end 
end
