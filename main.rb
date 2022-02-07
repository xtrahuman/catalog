require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def start
    loop do
      menu
      option = gets.chomp
      break if option == 'q'

      @app.get_num(option)
    end
    @app.savedata
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
