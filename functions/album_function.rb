require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative './global'
require 'json'

class AlbumFunction
  def initialize(albums)
    @albums = albums
    @global = GlobalFunction.new
  end

  def list_genres
    puts 'There are no Genres to be displayed' if @albums.empty?
    @albums.each_with_index do |album, i|
      puts("#{i}) #{album.genre.name.upcase} genre available")
    end
  end

  def list_albums
    puts 'There are no Albums to be displayed' if @albums.empty?
    @albums.each_with_index do |album, i|
      puts "#{i}) #{album.genre.name.upcase} Album."
      puts "Published on: #{album.publish_date}, On Spotify: #{album.on_spotify}"
    end
  end

  def add_music_album
    text = 'Do you want to create a new genre (1) or select from an existing one (2) [Input the number]:'
    option = @global.input(text)
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
    genre = @global.input('Please enter name of genre')
    existing = @albums.any? { |album| album.genre.name.downcase == genre.downcase }
    if existing
      puts 'Genre already exists'
    else
      new_genre = Genre.new(name: genre)
      puts '------------------------'
      puts 'Enter Album details below'
      puts '------------------------'
      date = @global.input('Please enter album publish date in this format DD/MM/YYYY')
      on_spotify = @global.input('Is album on spotify [y/n]').downcase == 'y'
      new_album = MusicAlbum.new(publish_date: date, on_spotify: on_spotify)
      new_album.genre = new_genre
      @albums.push(new_album)
      puts 'Album Created Successfully'
    end
  end

  def select_existing_genre
    if @albums.empty?
      print 'There are no genres added, please add a new genre'
    else
      @albums.each_with_index { |album, i| puts("#{i}), Genre: #{album.genre.name}") }
      index = @global.input('Select index of genre you want to add').to_i
      genre = @albums[index].genre
      date = @global.input('Enter album Publish date in this format DD/MM/YYYY')
      on_spotify = @global.input('Is album on spotify, Enter yes as [y] and no as [n]').downcase == 'y'
      new_album = MusicAlbum.new(publish_date: date, on_spotify: on_spotify)
      new_album.genre = genre
      @albums << new_album
      puts 'Album Created Successfully'
    end
  end
end
