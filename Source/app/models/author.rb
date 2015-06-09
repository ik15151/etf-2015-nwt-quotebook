class Author < ActiveRecord::Base
  has_many :quotes, dependent: :destroy
  
  default_scope -> { order(name: :asc) }
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :biography, length: { maximum: 3000 }
end
