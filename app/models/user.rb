class User < ApplicationRecord

    validates :first_name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

    before_save { email.downcase! }                 
    has_secure_password
    validates :password, length: { minimum: 6 }
end
