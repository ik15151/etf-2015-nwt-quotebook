class User < ActiveRecord::Base
  belongs_to :privilege
  has_many :password_recovery_tokens
  has_many :categories
end
