# Preview all emails at http://localhost:3000/rails/mailers/script_resources_mailer
class ScriptResourcesMailerPreview < ActionMailer::Preview

    def test_email_preview
        ScriptResourcesMailer.test_email("test@email.com")
    end

end
