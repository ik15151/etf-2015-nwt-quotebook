class RemoveDatetimeFromQuotes < ActiveRecord::Migration
  def up
    remove_column :quotes, :datetime
  end

  def down
    add_column :quotes, :datetime, :datetime
  end
end
