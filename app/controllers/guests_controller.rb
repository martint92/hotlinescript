class GuestsController < ApplicationController
    after_action :clean_guests

    def new
        @guest = Guest.new 
        respond_to(:html, :js)
    end 

    def create
        respond_to(:js)
        @guest = Guest.create!(guest_params)
        @guest.content = Email.where(params[:subject => @guest.subject]).first
        @guest.save 
        ScriptResourcesMailer.custom_email(@guest).deliver_now 
    end 

    def test_email
        ScriptResourcesMailer.test_email(User.find(1)).deliver_now
        redirect_to '/'
    end

    private 
        def guest_params
            params.require(:guest).permit(:email, :subject, :content)
        end 

        def clean_guests
            while Guest.count > 5 
                Guest.first.destroy
            end 
        end 
end
