# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_04_191200) do

  create_table "artists", force: :cascade do |t|
    t.string "artistname"
    t.string "genre"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "playdate"
    t.integer "artist_id"
    t.integer "venue_id"
    t.index ["artist_id"], name: "index_events_on_artist_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.date "playdate"
    t.integer "cityid"
    t.string "state"
    t.string "city"
    t.string "zip"
    t.integer "artist_id"
    t.integer "event_id"
    t.index ["artist_id"], name: "index_venues_on_artist_id"
    t.index ["event_id"], name: "index_venues_on_event_id"
  end

  add_foreign_key "events", "artists"
  add_foreign_key "events", "venues"
  add_foreign_key "venues", "artists"
  add_foreign_key "venues", "events"
end
