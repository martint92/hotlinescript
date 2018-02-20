class Email < ApplicationRecord
    before_create :assign_css_id
    validates :css_id, presence: true 

    def assign_css_id
        self.css_id = SecureRandom.uuid
    end 
end
