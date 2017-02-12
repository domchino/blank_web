class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :artist_name, :string
    add_column :users, :creative_field, :string
    add_column :users, :bio, :text

    add_index :users, :username, unique: true
  end
end
