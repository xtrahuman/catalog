require_relative 'app'
require 'json'

class Main
  def initialize
    @app = App.new
    puts '------------------------'
    puts 'WELCOME TO CATALOG OF THINGS'
    puts '------------------------'
  end

  def start
    loop do
      menu
      option = gets.chomp
      break if option == 'q'

      @app.add_num(option) if %w[7 8 9].include?(option)
      puts 'Please enter a number between 1 and 9.' unless %w[1 2 3 4 5 6 7 8 9].include?(option.to_s)
      @app.get_num(option)
    end
    @app.save
    puts 'thanks for using our catalog'
  end

  def menu
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts 'q - Exit'
  end
end

Main.new.start
