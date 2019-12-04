class CreateEventsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      #table and column to reference (join)
      t.string :name
      t.date :playdate
      t.references :artist, foreign_key: true
      t.references :venue, foreign_key: true
    end
  end
end
