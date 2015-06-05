class AddUserToQuotes < ActiveRecord::Migration
  def change
    add_reference :quotes, :user, index: true, foreign_key: true
    add_index :quotes, [:user_id, :created_at]
  end
end
