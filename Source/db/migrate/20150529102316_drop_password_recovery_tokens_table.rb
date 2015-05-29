class DropPasswordRecoveryTokensTable < ActiveRecord::Migration
  def up
    drop_table :password_recovery_tokens
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
