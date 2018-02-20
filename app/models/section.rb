class Section < ApplicationRecord
    include RailsSortable::Model 
    set_sortable :priority, without_updating_timestamps: true 
    
    belongs_to :topic 

    # Sub_Section Association
    has_many :sub_sections, dependent: :destroy, inverse_of: :section
    accepts_nested_attributes_for :sub_sections, allow_destroy: true

    before_create :assign_css_id

    def assign_css_id
        self.css_id = SecureRandom.uuid
    end 
end
