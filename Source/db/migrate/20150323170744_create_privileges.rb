class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.string :name, :null => false
      t.text :description, :null => false

      t.timestamps null: false
    end
  end
end
