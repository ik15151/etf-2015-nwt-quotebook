class Quote < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_and_belongs_to_many :tags
end
