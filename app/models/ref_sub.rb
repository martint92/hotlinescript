class RefSub < ApplicationRecord
    include RailsSortable::Model 
    set_sortable :priority, without_updating_timestamps: true 
    
    belongs_to :referral

    validates :title, presence: true 
    validates :body, presence: true 

end
