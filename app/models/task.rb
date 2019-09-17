class Task < ApplicationRecord
    validates :title,  presence: true, length: { maximum: 60 }
    validates :content,  presence: true, length: { maximum: 150 }
    validates :deadline,  presence: true
end
