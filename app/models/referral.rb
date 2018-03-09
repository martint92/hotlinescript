class Referral < ApplicationRecord
    include RailsSortable::Model 
    audited
    set_sortable :priority, without_updating_timestamps: true 

    validates :title, presence: true 

    scope :ir, -> { where(category: "Immigration Legal") }
    scope :olr, -> { where(category: "Other Legal") }
    scope :ss, -> { where(category: "Social Services") }

    has_many :ref_subs, dependent: :destroy, inverse_of: :referral
    accepts_nested_attributes_for :ref_subs, allow_destroy: true
end
