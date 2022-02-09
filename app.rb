require_relative './modules/albumfunction'

class App
  def initialize
    @albums = []
    @album_list = AlbumFunction.new(@albums)
  end

  def get_num(option)
    case option
    when '1'
      puts 'list_all_books'
    when '2'
      @album_list.list_albums
    when '3'
      puts 'list_all_games'
    when '4'
      @album_list.list_genres
    when '5'
      puts 'list_all_labels'
    when '6'
      puts 'list_all_authors'
    end
  end

  def add_num(option)
    case option
    when '7'
      puts 'add_book'
    when '8'
      @album_list.add_music_album
    when '9'
      puts 'add_game'
    end
  end
end
