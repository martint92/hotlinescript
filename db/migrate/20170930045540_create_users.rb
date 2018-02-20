class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :activation_digest 
      t.boolean :activation 
      t.datetime :activation_at
      t.uuid :css_id
      t.timestamps
    end
  end
end
