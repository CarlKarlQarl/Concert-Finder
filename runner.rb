require_relative 'config/environment.rb'

Artist.load(JSON.parse(File.read('./db/artist.json')))
Venue.load(JSON.parse(File.read('./db/venues.json')))
Event.load(JSON.parse(File.read('./db/events.json')))

Artist.by_id(310565)
binding.pry
Menu.new.start_menu