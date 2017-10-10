class User < ApplicationRecord

    has_secure_password
    before_create :create_activation_digest
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

    def :create_activation_digest
        self.activation_token = User.new_token
    end 
    

end
