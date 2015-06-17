class DropQuotesTagsTable < ActiveRecord::Migration
  def up
    drop_table :quotes_tags, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
