class User < ApplicationRecord
 
    before_save :email_downcase

    validates :first_name,  presence: true, length: { maximum: 50 }
    validates :last_name,  presence: true, length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    has_secure_password

    validates :password, presence: true, length: { minimum: 6 }


    def editor?
        case self.role 
        when "admin" then true 
        when "editor" then true 
        else 
            false 
        end 
    end

    def admin?
        self.role == 'admin' ? true : false 
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end 

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def email_downcase
        self.email = email.downcase
    end 
end 

