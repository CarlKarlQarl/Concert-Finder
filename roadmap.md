#Objectives/Milestones/Things-To-Do
1. Retrieving data from PollStar API
    * Before anything else, test that we're able to get data from them in some workable form.
    * Or even in an unworkable form, and then find some way to make it work within Ruby.
    * A live version would be ideal/impressive, but if it's not playing nice, we shouldn't bang our head against it too much and go with a local copy of the data.
1. CLI interface, user menu, and prompts
    * Likely to be a simple list of options, followed by text inputs from the user.
    * Account for typos or bad user input (i.e. enter a word during a menu number prompt)
    * This isn't the best place to describe it, so we should draw up a flowchart or something for this.
1. Structure of program files
    * Ideally, we run one file, and then the rest of the program will follow. The runner.rb -> environment.rb -> etc. set-up will probably work just fine for us.
1. Methods/searches could run in any order
    * If the user searches for concerts by zip code first, they can then search by artist over that first search's results
    * This should mean making the methods kind of broad, or able to work with whatever collection of data is passed to them, whether it be the raw data from PollStar, or the processed data from a prior search.
1. Formatting search results
    * Searches are likely to return quite a few results, so these need to be displayed without flooding the terminal screen
    * Perhaps withhold displaying results if the return is going to display more than 100 items, or require/prompt the user before showing that many.
