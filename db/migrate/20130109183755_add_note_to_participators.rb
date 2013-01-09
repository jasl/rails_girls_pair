class AddNoteToParticipators < ActiveRecord::Migration
  def change
    add_column :participators, :note, :string
  end
end
