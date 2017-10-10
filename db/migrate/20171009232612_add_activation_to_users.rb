class AddActivationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activation_digest, :string
    add_column :users, :activation, :boolean
    add_column :users, :activation_at, :datetime
  end
end
