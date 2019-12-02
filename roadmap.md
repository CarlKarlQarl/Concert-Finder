#Objectives/Milestones/Things-To-Do
1. Retrieving data from PollStar API
    * Using local copies, one for city, venue, and artist
1. CLI interface, user menu, and prompts
    * Searching by city, artist, and venue
    * Each search will search its own database
1. Structure of program files
    * Ideally, we run one file, and then the rest of the program will follow. The runner.rb -> environment.rb -> etc. set-up will probably work just fine for us.
1. Methods/searches could run in any order
    * If the user searches for concerts by zip code first, they can then search by artist over that first search's results
    * This should mean making the methods kind of broad, or able to work with whatever collection of data is passed to them, whether it be the raw data from PollStar, or the processed data from a prior search.
1. Formatting search results
    * Searches are likely to return quite a few results, so these need to be displayed without flooding the terminal screen
    * Perhaps withhold displaying results if the return is going to display more than 100 items, or require/prompt the user before showing that many.
