class CreateQuotesTags < ActiveRecord::Migration
  def change    
    create_table :quotes_tags, id: false do |t|
      t.belongs_to :quote, index: true
      t.belongs_to :tag, index: true
    end
  end
end