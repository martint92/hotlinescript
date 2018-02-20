class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title 
      t.integer :priority
      t.uuid :css_id
      t.timestamps
    end
  end
end
