class Quote < ActiveRecord::Base
  belongs_to :user  
  belongs_to :author
  has_and_belongs_to_many :tags
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 3000 }
  validates :source, length: { maximum: 200 }
  validates :comment, length: { maximum: 5000 }  
end
