class CreateHotlinks < ActiveRecord::Migration[5.1]
  def change
    create_table :hotlinks do |t|
      t.string :title
      t.text :url
      t.uuid :css_id
      t.integer :priority
      t.timestamps
    end
  end
end
