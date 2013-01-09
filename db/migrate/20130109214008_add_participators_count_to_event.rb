class AddParticipatorsCountToEvent < ActiveRecord::Migration
  def change
    add_column :events, :participators_count, :integer, :null => false, :default => 0
  end
end
