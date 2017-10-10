class User < ApplicationRecord

    has_secure_password
    before_save :email_downcase

    def editor?
        self.role == 'editor' || 'admin'
    end

    def admin?
        self.role == 'admin'
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end 

    def email_downcase
        self.email = email.downcase
    end 
end 

