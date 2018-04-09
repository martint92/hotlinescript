class GuestsController < ApplicationController
    after_action :clean_guests

    def open_email
        render layout: 'send_mail'
    end 

    def send_email
        render :close_window
        @guest = Guest.create(guest_params)
        ScriptResourcesMailer.guest_email(@guest).deliver_now
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
