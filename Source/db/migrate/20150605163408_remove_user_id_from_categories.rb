class RemoveUserIdFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :user_id
  end

  def down
    add_column :categories, :user_id, :integer
  end
end
