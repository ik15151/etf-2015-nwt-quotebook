class Quote < ActiveRecord::Base  
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end
   
  def all_tags
    self.tags.map(&:name).join(", ")
  end
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).quotes
  end

  belongs_to :user  
  belongs_to :author
  has_many :taggings
  has_many :tags, through: :taggings
  
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 3000 }
  validates :source, length: { maximum: 200 }
  validates :comment, length: { maximum: 5000 }
end
