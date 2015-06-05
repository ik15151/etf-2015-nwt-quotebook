class RenameTextToContentInQuotes < ActiveRecord::Migration
  def change
    rename_column :quotes, :text, :content
  end
end
