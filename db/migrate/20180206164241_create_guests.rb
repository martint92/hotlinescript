class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :email
      t.string :subject
      t.text :content
      t.timestamps
    end
  end
end
