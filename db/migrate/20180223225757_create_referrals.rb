class CreateReferrals < ActiveRecord::Migration[5.1]
  def change
    create_table :referrals do |t|
      t.string :category
      t.string :title
      t.text :body
      t.integer :priority

      t.timestamps
    end
  end
end
