class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :managable, :boolean, :default => false
    add_column :users, :role, :string, :default => 'girl'
  end
end
