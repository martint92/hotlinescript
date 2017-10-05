class CreateFaqposts < ActiveRecord::Migration[5.1]
  def change
    create_table :faqposts do |t|

      t.timestamps
    end
  end
end
