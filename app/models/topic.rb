class Topic < ApplicationRecord
    include RailsSortable::Model 
    audited
    set_sortable :priority, without_updating_timestamps: true 


    before_validation :assign_css_id
    validates :css_id, presence: true 

    def assign_css_id
        self.css_id = SecureRandom.uuid
    end 

    validates :title, presence: true 

    # Section Association
    has_many :sections, dependent: :destroy, inverse_of: :topic
    accepts_nested_attributes_for :sections, allow_destroy: true
end
