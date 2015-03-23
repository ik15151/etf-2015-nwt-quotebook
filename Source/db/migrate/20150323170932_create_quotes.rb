class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :text, :null => false
      t.text :source
      t.datetime :datetime, :null => false
      t.text :comment
      t.boolean :favorite
      t.string :rate
      t.references :category, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
