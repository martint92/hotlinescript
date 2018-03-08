class MicroSection < ApplicationRecord
    include RailsSortable::Model 
    set_sortable :priority, without_updating_timestamps: true 
    
    belongs_to :sub_section

    validates :title, presence: true 
    validates :body, presence: true 
    
    before_create :assign_css_id

    def assign_css_id
        self.css_id = SecureRandom.uuid
    end 
end
