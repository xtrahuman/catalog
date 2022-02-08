require_relative 'get_game'
class App
  def initialize
    @games = []
    @get_game = AllGame.new(@games)
  end

  def get_num(option)
    case option
    when '1'
      puts 'list_all_books'
    when '2'
      puts 'list_all_music_albums'
    when '3'
      puts @get_game.list_all_games
    when '4'
      puts 'list_all_genres'
    when '5'
      puts 'list_all_labels'
    when '6'
      puts 'list_all_authors'
    end
  end

  def add_num(option)
    case option
    when '7'
      puts 'Add a book'
    when '8'
      puts 'add_music_album'
    when '9'
      puts @get_game.add_game
    end
  end

  # def savedata
  #   @run_data.save_music
  #   @run_data.save_books
  #   @run_data.save_game
  # end
end
