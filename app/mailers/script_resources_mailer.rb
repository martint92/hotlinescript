require 'mailgun'

class ScriptResourcesMailer < ApplicationMailer
    # default from: "hotline@houstonimmigration.org"
    # http://localhost:3000/rails/mailers/script_resources_mailer/test_email_preview.html

    def test_email(user)
        @user = user
        mg_client = Mailgun::Client.new ENV['MAILGUN_API']
        message_params = {
            from: " immigrantrightshotline@houstonimmigration.org",
            to: @user.email ,
            subject: "Test Email",
            text: "Email Body"
        }
        mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
    end 

    def custom_email(guest) 
        @guest = guest 
        mail(to: @guest.email, subject: @guest.subject )
    end 
end
