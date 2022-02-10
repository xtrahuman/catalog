require_relative './functions/game_function'
require_relative './functions/album_function'
require_relative './functions/book_function'
require_relative './functions/global'

class App
  def initialize
    @preserve = GlobalFunction.new
    @games = @preserve.load_data('games')
    @game_list = GameFunction.new(@games)
    @albums = @preserve.load_data('musicalbum')
    @album_list = AlbumFunction.new(@albums)
    @books = @preserve.load_data('books')
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

  def save
    @preserve.save_data('musicalbum', @albums)
    @preserve.save_data('games', @games)
    @preserve.save_data('books', @books)
  end
end
