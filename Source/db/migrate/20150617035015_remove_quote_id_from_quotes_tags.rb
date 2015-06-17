class RemoveQuoteIdFromQuotesTags < ActiveRecord::Migration
  def up
    remove_column :quotes_tags, :quote_id
  end

  def down
    add_column :quotes_tags, :quote_id, :integer
  end
end