class Menu
    def start_menu
        system "clear"
        puts "Welcome to Concert Finder"
        puts "Search for Colorado events happening in January 2020"
        main_menu
    end

    def main_menu
        puts "--How would you like to search for an event?--"
        puts "1) Search by city"
        puts "2) Search by artist"
        puts "3) Search by venue"
        print "Enter a menu option: "
        user_input = gets.chomp

        case user_input
        when "1"
            system "clear"
            city_search_menu
        when "2"
            system "clear"
            artist_search_menu
        when "3"
            system "clear"
            venue_search_menu
        else
            puts "Please retry with a valid menu option."
            puts ""
            main_menu
        end
    end

    def city_search_menu
        puts "--City Search--"
        print "Enter your city's zip code: "
        user_city = gets.chomp
        puts ""

        if find_city user_city
            puts "Here are the upcoming events for #{user_city}:"
            puts ""
            #Run find_city again and post results here
            #Hard coded sample below
            puts "Bon Jovi at Lorum Ipsum on 1/12"
            puts "Enya at Some Place on 1/25"
            puts "Queen at Another Place on 1/3"
            puts ""
            print "Press Return to go back to the main menu..."
            pause = gets
            #For testing, looping back to beginning
            system "clear"
            start_menu
        else
            puts "No results found for that zip code. Try again."
            puts ""
            city_search_menu
        end
    end

    def artist_search_menu
        puts "--Artist Search--"
        print "Enter the artist or band's name: "
        user_artist = gets.chomp
        puts ""

        if find_artist user_artist
            puts "Here are the upcoming events for #{user_artist}:"
            puts ""
            #Run find_artist again and post results here
            #Hard coded sample below
            puts "Lorum Ipsum in Denver on 1/29"
            puts "Some Place in Boulder on 1/23"
            puts "Another Place in Arvada on 1/13"
            puts ""
            print "Press Return to go back to the main menu..."
            pause = gets
            #For testing, looping back to beginning
            system "clear"
            start_menu
        else
            puts "No results found for that artist. Try again."
            puts ""
            artist_search_menu
        end
    end

    def venue_search_menu
        puts "--Venue Search--"
        print "Enter the venue's name: "
        user_venue = gets.chomp
        puts ""

        if find_venue user_venue
            puts "Here are the upcoming events at #{user_venue}:"
            puts ""
            #Run find_venue again and post results here
            #Hard coded sample below
            puts "Bon Jovi on 1/12"
            puts "Weird Al on 1/1"
            puts "Cher on 1/15"
            puts ""
            print "Press Return to go back to the main menu..."
            pause = gets
            #For testing, looping back to beginning
            system "clear"
            start_menu
        else
            puts "No results found for that venue. Try again."
            puts ""
            artist_search_menu
        end
    end

    def find_city city
        #Receives the zip code that the user entered
        #Returns events within that zip code
        #If no results are found, returns nil
        #For now, will return true or false, as needed for testing

        true
        #false
    end

    def find_artist artist
        #Receives the artist name that the user entered
        #Returns events with that artist
        #If no results are found, returns nil
        #For now, will return true or false, as needed for testing

        true
        #false
    end

    def find_venue venue
        #Receives the venue name that the user entered
        #Returns events at that venue
        #If no results are found, returns nil
        #For now, will return true or false, as needed for testing

        true
        #false
    end
end