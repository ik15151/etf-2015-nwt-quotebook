class CreatePasswordRecoveryTokens < ActiveRecord::Migration
  def change
    create_table :password_recovery_tokens do |t|
      t.string :recovery_token, :null => false
      t.timestamp :request_timestamp, :null => false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
