class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :title
      t.text :body
      t.boolean :mailer
      t.string :alert
      t.timestamps
    end
  end
end
