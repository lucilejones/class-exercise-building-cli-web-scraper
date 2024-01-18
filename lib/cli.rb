require_relative 'scraper.rb'

class CLI
  def run
    # puts "running program"
    User.seed
    greet
    enter_credentials
    # while menu != 'exit'
    # end
    sign_in
    menu
    goodbye
  end

  def enter_credentials
    puts "Do you have an account? Type 'Y' to sign in or 'N' to sign up: "
    
  end

  def sign_in
    is_athenticated = false

    until is_authenticated
      puts "Please enter your username: "
      username = gets.chomp
      puts "Please enter your password: "
      password = gets.chomp

      is_athenticated = Auth.authenticate_user(username, password, User.all)

      if is_authenticated
        puts "Welcome, #{username}!"
      else
        puts "Invalid username or password. Please try again."
      end
    end
  end

  def sign_up
    puts "Sign up\n"
    puts "Please enter a username: "
    username = gets.chomp
    puts "Please enter a password: "
    password = gets.chomp

    User.new(username, password)

    puts "Welcome, #{username}! Please sign in to continue."

    sign_in
  end

  def greet
    puts "Welcome to this Book Search CLI!"
    puts "Enter your name to see a list of genres you can search by."
    input_name = gets.strip
    puts "Hello, #{input_name}!"
    puts "Here are the genres: "
    Scraper.scrape_data
  end

  def menu
    puts "Enter a book genre to see a list of books."
    input_genre = gets
    list_books(input_genre)
    # input_genre
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