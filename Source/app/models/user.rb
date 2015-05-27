class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  belongs_to :privilege
  has_many :password_recovery_tokens
  has_many :categories
end
