class ScriptResourcesMailer < ApplicationMailer
    default from: "hotline@houstonimmigration.org"

    # http://localhost:3000/rails/mailers/script_resources_mailer/test_email_preview.html
    def test_email(guest)
        @guest = guest 
        mail(to: @guest, subject: 'Test Email')
    end 
end
