class CreateArtistsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      #table and column to reference (join)
      t.string :artistname
      t.string :genre
    end
  end
end
