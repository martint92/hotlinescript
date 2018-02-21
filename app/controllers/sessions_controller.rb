class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to '/'
    else
        flash[:notice] = "Login Failed. Please check your username and/or password and try again."
        render 'new'
    end 
  end

  def destroy
      session[:user_id] = nil
      redirect_to '/'
  end
end
