require_relative './functions/game_function'
require_relative './functions/album_function'
require_relative './functions/book_function'

class App
  def initialize
    @games = []
    @game_list = GameFunction.new(@games)
    @albums = []
    @album_list = AlbumFunction.new(@albums)
    @books = []
    @book_list = BookFuction.new(@books)
  end

  def get_num(option)
    case option
    when '1'
      @book_list.list_all_books
    when '2'
      @album_list.list_albums
    when '3'
      @game_list.list_all_games
    when '4'
      @album_list.list_genres
    when '5'
      @book_list.list_all_labels
    when '6'
      @game_list.list_all_authors
    end
  end

  def add_num(option)
    case option
    when '7'
      @book_list.add_book
    when '8'
      @album_list.add_music_album
    when '9'
      @game_list.add_game
    end
  end
end
