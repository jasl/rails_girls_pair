class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :bio, :string
    add_column :users, :realname, :string
    add_column :users, :gender, :boolean
  end
end
