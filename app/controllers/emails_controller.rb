class EmailsController < ApplicationController

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

  def open_email
    render layout: 'send_mail'
  end 

  def send_email
    render :close_window
    @guest = Guest.create(guest_params)
    ScriptResourcesMailer.guest_email(@guest).deliver_now
  end 

  private 
    def email_params
      params.require(:email).permit(:subject, :content)
    end 

    def guest_params
      params.require(:guest).permit(:email, :subject, :content)
    end 
end
