class UsersController < ApplicationController
    before_action :require_editor, only: [:invite_user, :send_invite]
    before_action :require_user

    def index
        #ScriptResourcesMailer.test_email.deliver_now
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

    def invite_user
        @user = User.new 
        respond_to :js 
    end 

    def send_invite
        respond_to :js
        @user = User.new(invite_params)
        @user.save(validate: false)
        UserMailer.invite_email(@user).deliver_now
    end 


    def edit
        @user = User.find(params[:id])
        respond_to do |format|
            format.js 
        end 
    end

    def update
        @user = User.find(params[:id])
        if current_user && current_user.admin?
            @user.update_attributes!(user_params_admin)
            @users = User.all 
            redirect_to user_path(@user)
        elsif @user.update_attributes!(user_params)
            @users = User.all
            redirect_to user_path(@user)
        else
            render edit_user_path(@user)
        end
    end

    def destroy 
        @user = User.find(params[:id]).destroy
        redirect_to :index
    end

    private
        def user_params_admin
            params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
        end

        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password)
        end

        def invite_params
            params.require(:user).permit(:email)
        end
end
