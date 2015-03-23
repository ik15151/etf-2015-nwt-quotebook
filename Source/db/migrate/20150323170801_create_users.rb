class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :password, :null => false
      t.string :salt, :null => false
      t.references :privilege, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
