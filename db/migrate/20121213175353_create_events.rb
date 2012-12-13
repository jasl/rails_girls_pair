class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, :null => false
      t.text :body
      t.date :date, :null => false

      t.timestamps
    end
  end
end
