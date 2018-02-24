class Reminder < ApplicationRecord
    validates :body, presence: true 
end
