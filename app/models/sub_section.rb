class SubSection < ApplicationRecord
  include RailsSortable::Model 
  audited
  set_sortable :priority, without_updating_timestamps: true 
  
  belongs_to :section
  validates :title, :body, presence: true 

  # Section Association
  has_many :micro_sections, dependent: :destroy, inverse_of: :sub_section
  accepts_nested_attributes_for :micro_sections, allow_destroy: true

  before_create :assign_css_id

  def assign_css_id
      self.css_id = SecureRandom.uuid
  end 
end
