class Referral < ApplicationRecord
    include RailsSortable::Model 
    set_sortable :priority, without_updating_timestamps: true 

    validates :title, presence: true 

    scope :ir, -> { where(category: "Immigration Referral") }
    scope :olr, -> { where(category: "Other Referral") }
    scope :ss, -> { where(category: "Social Services") }

end
