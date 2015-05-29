class DropPrivilegesTable < ActiveRecord::Migration
  def up
    drop_table :privileges, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
