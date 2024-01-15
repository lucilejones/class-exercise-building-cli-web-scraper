require_relative 'scraper.rb'

class CLI
  def run
    # puts "running program"
    greet
    # while menu != 'exit'
    # end
    menu
    goodbye
  end

  def greet
    puts "Welcome to this Book Search CLI"
    puts "What is your name?"
    input_name = gets.strip
    puts "Hello, #{input_name}!"
    puts "Here are the genres you can search by: "
    Scraper.scrape_data
  end

  def menu
    puts "Enter a book genre to see a list of books."
    input_genre = gets.downcase
    list_books(input_genre)
    input_genre
  end

  def list_books(genre)
    puts "Listing books with genre #{genre}..."
    Scraper.get_books_by_genre(genre)
  end

  # def menu
  #   list_options
  #   input = gets.chomp.downcase
  #   choose_option(input)
  #   input
  # end

  # def list_options
  #   puts "Please choose an option:"
  #   puts "1. Search by genre"
  #   puts "2. Search by title"
  #   puts "Exit by typing 'exit'"
  # end

  # def choose_option(option)
  #   case option
  #   when '1'
  #     puts "Please enter a genre: "
  #   when '2'
  #     puts "Please enter a title: "
  #   else 
  #     puts "Please enter a valid option"
  #   end
  # end

  def goodbye
    puts "Thanks for using this Book Search CLI! Goodbye!"
  end
end