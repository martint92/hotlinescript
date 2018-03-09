class Email < ApplicationRecord
    before_create :assign_css_id

    def assign_css_id
        self.css_id = SecureRandom.uuid
    end 
end
