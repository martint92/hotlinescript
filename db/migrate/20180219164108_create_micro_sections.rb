class CreateMicroSections < ActiveRecord::Migration[5.1]
  def change
    create_table :micro_sections do |t|
      t.string :title
      t.text :body 
      t.belongs_to :sub_section, foreign_key: true
      t.uuid :css_id
      t.integer :priority
      t.timestamps
    end
  end
end
