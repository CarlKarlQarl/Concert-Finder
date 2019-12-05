class Menu
    def start_menu
        system "clear"
        puts " Welcome to Concert History Finder ".green.on_black
        puts " Search history of #{Event.all.count} Colorado events".green.on_black
        main_menu
    end

    def main_menu
        system "clear"
        while true do

        puts "--How would you like to search for an event?--".white.on_black
        puts "1) Search by city"
        puts "2) Search by artist"
        puts "3) Search by venue"
        puts "0) Exit Program"
        print "Enter a menu option: "

        user_input = gets.chomp
            case user_input
            when "1"
                city_search_menu
            when "2"
                artist_search_menu
            when "3"
                venue_search_menu
            when "0"
                puts "Thank you for using Concert Finder!"
                exit
            else
                puts ""
                puts "Please retry with a valid menu option.".red
                puts ""
            end
        end
    end

    def city_search_menu
        system "clear"
        puts "--City Search--".white.on_black
        while true do
            print "Enter your city's zip code (q to quit): "
            user_city = gets.chomp
            return_to_main_menu user_city
            puts ""

            venues = Venue.find_cities(user_city)

            if venues.length == 0
                puts "No results found for that zip code."
            else
                relevant_events = []

                venues.each do |venue|
                    relevant_events << venue.get_events
                end
            
                relevant_events.flatten!

                puts "Here are the events for #{user_city}:"
                relevant_events.length.times do |index|
                    puts "#{index}) #{relevant_events[index].artist.artistname} played at #{relevant_events[index].venue.name} on #{relevant_events[index].playdate}"
                end

                puts ""
                print "Press Return to go back to the main menu..."

                pause = gets
                start_menu
            end
        end
    end

    def artist_search_menu
        system "clear"
        puts "--Artist Search--".white.on_black
        puts "There are #{Artist.all.count} artists on record"

        #binding.pry
        while true
            print "Enter the artist or band's name (q to quit): "
            user_artist = gets.chomp
            return_to_main_menu user_artist
            puts ""


            result = Artist.find_artist(user_artist)
            if result
                shows = result.get_events()
                puts "Here are the events for #{user_artist}:"
                puts ""

                #binding.pry
                puts "#{result.artistname} played #{shows.length} show(s)..."
                shows.each {|event| puts "#{event.venue.name} on #{event.playdate}" }

                puts ""
                print "Press Return to go back to the main menu..."

                pause = gets
                start_menu
            else
                puts "No results found for '#{user_artist}'. Try again."
                puts ""
            end
        end
    end

    def venue_search_menu
        system "clear"
        puts "--Venue Search--".white.on_black
        puts "There are #{Venue.all.count} venues on record"
        print "Enter the venue's name (q to quit): "
        user_venue = gets.chomp        
        return_to_main_menu user_venue
        puts ""


        venue = Venue.find_venue(user_venue)
        if venue
            events = venue.get_events
            #binding.pry
            puts "Here are the upcoming events at #{user_venue}:"
            puts ""
            events.each {|event| puts "#{event.artist.artistname} played on #{event.playdate}"}

            puts ""
            print "Press Return to go back to the main menu..."

            pause = gets
            start_menu
        else
            puts "No results found for that venue. Try again."
            puts ""
            venue_search_menu
        end
    end


    def return_to_main_menu choice
        if choice == "q"
            system "clear"
            start_menu
        end
    end
end