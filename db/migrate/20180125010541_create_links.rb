class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.text :option
      t.belongs_to :section, foreign_key: true

      t.timestamps
    end
  end
end
