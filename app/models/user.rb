class User < ApplicationRecord
  before_destroy :check_for_superadmin, prepend: true
  has_many :tasks, dependent: :destroy
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  has_secure_password

  private

  def check_for_superadmin
    if email != " "
      errors[:base] << "this is a supper admin"
      return true
    end
  end
end
