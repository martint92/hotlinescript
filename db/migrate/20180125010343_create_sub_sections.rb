class CreateSubSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_sections do |t|
      t.string :title
      t.text :body
      t.belongs_to :section, foreign_key: true
      t.uuid :css_id
      t.integer :priority
      t.timestamps
    end
  end
end
