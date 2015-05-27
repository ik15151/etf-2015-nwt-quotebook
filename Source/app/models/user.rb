class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  belongs_to :privilege
  has_many :password_recovery_tokens
  has_many :categories
end
