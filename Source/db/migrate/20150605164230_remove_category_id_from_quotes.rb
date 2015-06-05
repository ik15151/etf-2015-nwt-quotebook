class RemoveCategoryIdFromQuotes < ActiveRecord::Migration
  def up
    remove_column :quotes, :category_id
  end

  def down
    add_column :quotes, :category_id, :integer
  end
end
