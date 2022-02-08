require_relative '../classes/musicalbum'
require_relative '../classes/genre'

class AlbumFunction
  def initialize
    @all_albums = []
  end

  def list_genres
    if @all_albums.length.zero?
      puts 'There are no Genres to be displayed'
    else
      @all_albums.each_with_index do |album, i|
        puts("#{i}) Genre: #{album.genre.name}, Genre_id: #{album.genre.id}")
      end
    end
  end

  def list_albums
    if @all_albums.length.zero?
      puts 'There are no Albums to be displayed'
    else
      @all_albums.each_with_index do |album, i|
        puts("#{i}) Published Date: #{album.publish_date}, Album_id: #{album.id}")
      end
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
    puts 'Please enter name of genre'
    genre = gets.chomp
    existing = @all_albums.any? { |album| album.genre.name.downcase == genre.downcase }
    if existing
      puts 'Genre already exists'
      nil
    else
      new_genre = Genre.new(genre)
      print 'Enter Album Published Date => '
      date = gets.chomp
      new_album = MusicAlbum.new(date)
      new_album.genre = new_genre
      @all_albums.push(new_album)
      puts 'Album Created Successfully'
    end
  end

  def select_existing_genre
    puts 'Please select index of genre you wil like to add'
    @all_albums.each_with_index { |album, i| puts("#{i}), Genre: #{album.genre.name}, Genre_ID: #{album.genre.id}") }
    index = gets.chomp.to_i
    genre = @all_albums[index].genre
    print 'Enter Album publish datev=>v'
    date = gets.chomp
    new_album = MusicAlbum.new(date)
    new_album.genre = genre
    @all_albums << new_album
  end
end
