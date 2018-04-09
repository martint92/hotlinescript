class EmailsController < ApplicationController
  before_action :require_user 

  def index 
    @emails = Email.all 
  end 

  def show
    @email = Email.find(params[:id])
  end 

  def new 
    @email = Email.new 
  end 

  def create 
    @email = Email.create!(email_params) 
    if @email.save 
      flash[:success] = "Successful Created"
    else 
      flash[:alert] = "Failed to Create"
    end 
    redirect_to '/emails'
  end 

  def update 
    @email = Email.find(params[:id])
    if @email.update_attributes(email_params)
      flash[:success] = "Update Successful"
    else 
      flash[:alert] = "Update Failed"
    end 
    redirect_to "/emails"
  end 

  def destroy
    @email = Email.find(params[:id]).destroy 
  end 

  private 
    def email_params
      params.require(:email).permit(:subject, :content)
    end 
end
