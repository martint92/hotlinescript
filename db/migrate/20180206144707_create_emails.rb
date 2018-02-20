class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :subject
      t.text :content
      t.uuid :css_id
      t.timestamps
    end
  end
end
