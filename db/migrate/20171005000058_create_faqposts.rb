class CreateFaqposts < ActiveRecord::Migration[5.1]
  def change
    create_table :faqposts do |t|
      t.string :faqpost_title
      t.text :faqpost_body
      t.string :faqpost_author
      t.string :faqpost_editor

      t.timestamps
    end
  end
end
