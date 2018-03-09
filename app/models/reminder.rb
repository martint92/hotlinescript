class Reminder < ApplicationRecord
    audited
    validates :body, presence: true 
end
