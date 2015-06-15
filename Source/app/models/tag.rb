class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :quotes, through: :taggings
end
