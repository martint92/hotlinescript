class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :title
      t.text :body
      t.belongs_to :topic, foreign_key: true
      t.uuid :css_id
      t.integer :priority
      t.timestamps
    end
  end
end
