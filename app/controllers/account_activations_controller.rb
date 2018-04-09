class AccountActivationsController < ApplicationController

    def edit 
        @user = User.find_by(email: params[:email])
        redirect_to :already_activated if !@user.first_name.nil?
    end 

    def update
        @user = User.find_by(email: params[:email])
        if @user.update_attributes(user_params)
            redirect_to topics_index_url
        else 
            redirect_to :edit 
        end 
    end 

    def already_activated; end 

    private 
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password)
        end
end
