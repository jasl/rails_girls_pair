class CreateParticipators < ActiveRecord::Migration
  def change
    create_table :participators do |t|
      t.references :user, :null => false
      t.references :event, :null => false
      t.boolean :invited, :default => false, :null => false
      t.boolean :attended, :default => false, :null => false
      t.boolean :applied, :default => false, :null => false

      t.timestamps
    end
    add_index :participators, :user_id
    add_index :participators, :event_id
    add_index :participators, [:user_id, :event_id], :unique => true
  end
end
