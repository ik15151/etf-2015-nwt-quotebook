class RemoveTagIdFromQuotesTags < ActiveRecord::Migration
  def up
    remove_column :quotes_tags, :tag_id
  end

  def down
    add_column :quotes_tags, :tag_id, :integer
  end
end