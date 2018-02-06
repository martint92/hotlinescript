class ScriptResourcesMailer < ApplicationMailer
    # default from: "hotline@houstonimmigration.org"
    default from: "immigrationhotlineTX@gmail.com"

    # http://localhost:3000/rails/mailers/script_resources_mailer/test_email_preview.html
    def test_email(guest)
        @guest = guest 
        # mail(to: @guest, subject: 'Test Email')
        mail(to: "martin_thomas@alumni.baylor.edu", subject: 'Test Email')
    end 

    def sample_email(user)
        recipients  user.email 
        from        "Immigration Hotline <immigrationhotlineTX@gmail.com>"
        subject     "Testing Sample Email"
        sent_to     Time.now 
end
