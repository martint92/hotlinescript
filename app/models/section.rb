class Section < ApplicationRecord
    has_many :sub_sections, inverse_of: :section 
    has_many :links, inverse_of: :section 
    accepts_nested_attributes_for :sub_sections, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true
end
