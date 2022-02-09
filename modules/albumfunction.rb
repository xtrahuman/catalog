require_relative '../classes/musicalbum'
require_relative '../classes/genre'

class AlbumFunction
  def initialize(all_albums)
    @all_albums = all_albums
  end

  def get_user_input(message)
    print "#{message} => "
    gets.chomp
  end

  def list_genres
    puts 'There are no Genres to be displayed' if @all_albums.empty?
    @all_albums.each_with_index do |album, i|
      puts("#{i}) Genre: #{album.genre.name}, Genre_id: #{album.genre.id}")
    end
  end

  def list_albums
    puts 'There are no Albums to be displayed' if @all_albums.empty?
    @all_albums.each_with_index do |album, i|
      puts("#{i}) Published Date: #{album.publish_date}, Album_id: #{album.id}, on_spotify: #{album.on_spotify}")
    end
  end

  def add_music_album
    puts 'Do you want to create a new genre (1) or select from an existing one (2) [Input the number]:'
    option = gets.chomp
    case option
    when '1'
      create_new_genre
    when '2'
      select_existing_genre
    else
      puts 'Please selction either option 1 or 2'
      nil
    end
  end

  def create_new_genre
    genre = get_user_input('Please enter name of genre')
    existing = @all_albums.any? { |album| album.genre.name.downcase == genre.downcase }
    if existing
      puts 'Genre already exists'
    else
      new_genre = Genre.new(genre)
      date = get_user_input('Please enter album publish date in this format DD/MM/YYYY')
      on_spotify = get_user_input('Is album on spotify, Enter yes as [y] and no as [n]').downcase == 'y'
      new_album = MusicAlbum.new(date, on_spotify: on_spotify)
      new_album.genre = new_genre
      @all_albums.push(new_album)
      puts 'Album Created Successfully'
    end
  end

  def select_existing_genre
    if @all_albums.empty?
      print 'There are no genres added, please add a new genre'
    else
      @all_albums.each_with_index { |album, i| puts("#{i}), Genre: #{album.genre.name}, Genre_ID: #{album.genre.id}") }
      index = get_user_input('Select index of genre you want to add').to_i
      genre = @all_albums[index].genre
      date = get_user_input('Enter album Publish date in this format DD/MM/YYYY')
      on_spotify = get_user_input('Is album on spotify, Enter yes as [y] and no as [n]').downcase == 'y'
      new_album = MusicAlbum.new(date, on_spotify: on_spotify)
      new_album.genre = genre
      @all_albums << new_album
      puts 'Album Created Successfully'
    end
  end
end
