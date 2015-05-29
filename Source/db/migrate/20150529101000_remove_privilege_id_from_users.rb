class RemovePrivilegeIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :privilege_id
  end

  def down
    add_column :users, :privilege_id, :integer
  end
end
