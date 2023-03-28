require './app'
require './option'

class Main
  def initialize
    @app = App.new
  end

  def main
    puts 'welcome to school library App!'
    loop do
      puts "\nPlease choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit"
      user_input = gets.chomp
      process_options(user_input)
    end
  end
end

main = Main.new
main.main
