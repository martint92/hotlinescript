class ScriptResourcesMailer < ApplicationMailer
    # default from: "hotline@houstonimmigration.org"
    # http://localhost:3000/rails/mailers/script_resources_mailer/test_email_preview.html

    def test_email
        mail(to: 'martin_thomas@alumni.baylor.edu', subject: 'test email')
    end 

    def guest_email(guest)
        @guest = guest
        mail(to: @guest.email, subject: @guest.subject)
    end 

end
