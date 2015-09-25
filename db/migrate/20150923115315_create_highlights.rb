class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|

      t.timestamps null: false
      t.belongs_to :user
      t.string :selector,       limit: 64,         :null => false
      t.string :text,           :null => false
      t.string :host, limit: 64,         :null => false
      t.integer :port, limit: 6,         :null => false
      t.string :path , limit: 1024,         :null => false
      t.integer :is_https , limit: 6,         default: false
      t.integer :start_offset, limit: 6,         :null => false
      t.integer :end_offset, limit: 6,         :null => false

    end
  end
end
