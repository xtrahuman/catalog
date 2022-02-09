require_relative '../classes/musicalbum'
require_relative '../classes/genre'

class AlbumFunction
  def initialize(all_albums)
    @all_albums = all_albums
  end

  def get_user_input(message)
    print `#{message} => `
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
        puts("#{i}) Published Date: #{album.publish_date}, Album_id: #{album.id}")
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
    genre = get_user_input('Please enetr name of genre')
    existing = @all_albums.any? { |album| album.genre.name.downcase == genre.downcase }
    puts 'Genre already exists' if existing
    new_genre = Genre.new(genre)
    date = get_user_input('Please enter album publish date')
    on_spotify = get_user_input('Is album on spotify, Enter yes as [y] and no as [n]')
    on_spotify = on_spotify.downcase == 'y'
    new_album = MusicAlbum.new(publish_date: date, on_spotify: on_spotify)
    new_album.genre = new_genre
    @all_albums.push(new_album)
    puts 'Album Created Successfully'
  end

  def select_existing_genre
    puts 'Please select index of genre you wil like to add'
    @all_albums.each_with_index { |album, i| puts("#{i}), Genre: #{album.genre.name}, Genre_ID: #{album.genre.id}") }
    index = gets.chomp.to_i
    genre = @all_albums[index].genre
    date = get_user_input('Enter album Publish date')
    on_spotify = get_user_input('Is album on spotify, Enter yes as [y] and no as [n]')
    on_spotify = gets.chomp.downcase == 'y'
    new_album = MusicAlbum.new(date, on_spotify: on_spotify)
    new_album.genre = genre
    @all_albums << new_album
end
