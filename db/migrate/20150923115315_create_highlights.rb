class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|

      t.timestamps null: false
      t.belongs_to :user
      t.string :selector,       limit: 128,         :null => false
      t.string :text,           :null => false
      t.string :hostname, limit: 64,         :null => false
      t.string :pathname, limit: 2048,         :null => true
      t.string :search, limit: 2048,         :null => true
      t.string :pathname_hash , limit: 2048,         :null => true
      t.integer :port, limit: 6,         :null => false
      t.string :protocol , limit: 6,         default: false
      t.integer :start_offset, limit: 6,         :null => false
      t.integer :end_offset, limit: 6,         :null => false

    end
  end
end
