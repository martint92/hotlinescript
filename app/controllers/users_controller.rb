class UsersController < ApplicationController

    #before_action :require_editor, only: [:new]
    before_action :require_user, only: [:index, :show]

    def index
        @users = User.order(role: :asc)
    end

    def show
        begin
            @user = User.find(params[:id])
        rescue 
            @user ||= current_user
        end 
        respond_to do |format|
            format.js
            format.html
        end 
    end

    def new
        @user = User.new
       
    end

    def create
        @user = User.new(user_params)
        @user.password ||= 'password1'
        @user.role ||= 'volunteer'
        if @user.save
            session[:user_id] = @user.id 
            redirect_to '/'
        else
            redirect_to 'signup'
        end
    end

    def edit
        @user = User.find(params[:id])
        respond_to do |format|
            format.js 
        end 
    end

    def update
        @user = User.find(params[:id])
        @user.role ||= 'volunteer'
        if current_user && current_user.admin?
            @user.update_attributes(user_params_admin)
            @users = User.all 
            render 'index'
        elsif @user.update_attributes(user_params)
            @users = User.all
            render 'index'
        else
            render 'edit'
        end
    end

    def destroy 
        User.find(params[:id]).destroy
        flash[:notice] = "User Deleated"
        render 'index'
    end

    private
    def user_params_admin
        params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
    end
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end


end
