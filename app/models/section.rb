class Section < ApplicationRecord

    validates :title, presence: true 
    validates :body, presence: true 
    

    # Sub_Section Association
    has_many :sub_sections, dependent: :destroy, inverse_of: :section
    validates_associated :sub_sections
    accepts_nested_attributes_for :sub_sections, allow_destroy: true

    # Link Assocation
    has_many :links, dependent: :destroy
    validates_associated :links
    accepts_nested_attributes_for :links, allow_destroy: true

end
