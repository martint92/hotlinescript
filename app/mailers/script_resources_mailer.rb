class ScriptResourcesMailer < ApplicationMailer
    # default from: "hotline@houstonimmigration.org"
    default from: "immigrantrightshotline@houstonimmigration.org"

    # http://localhost:3000/rails/mailers/script_resources_mailer/test_email_preview.html
    def test_email(user)
        @user = user
        # mail(to: @guest, subject: 'Test Email')
        mail(to: @user.email , subject: 'Test Email')
    end 

    def custom_email(guest) 
        @guest = guest 
        mail(to: @guest.email, subject: @guest.subject )
    end 
end
