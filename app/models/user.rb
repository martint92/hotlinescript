class User < ApplicationRecord
    attr_accessor :activation_token 
 
    before_create :set_defaults, :assign_css_id, :create_activation_digest
    before_save :email_downcase

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    has_secure_password


    def editor?
        case self.role 
        when "admin" then true 
        when "editor" then true 
        else 
            false 
        end 
    end

    def set_defaults
        self.role = 'volunteer'
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

    private
        def create_activation_digest
            self.activation_token = User.new_token
            self.activation_digest = User.digest(activation_token)
        end 

        def email_downcase
            self.email = email.downcase
        end 

        def assign_css_id
            self.css_id = SecureRandom.uuid
        end 
end 

