class CreateVenuesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      #table and column to reference (join)
      t.string :name
      t.date :playdate
      t.integer :cityid
      t.string :state
      t.string :city
      t.string :zip

      
      
      t.references :artist, foreign_key: true
      t.references :event, foreign_key: true
      binding.pry
    end
  end
end
