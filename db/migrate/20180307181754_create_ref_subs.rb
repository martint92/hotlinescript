class CreateRefSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :ref_subs do |t|
      t.string :title
      t.text :body
      t.integer :priority
      t.belongs_to :referral, foreign_key: true
      t.timestamps
    end
  end
end
