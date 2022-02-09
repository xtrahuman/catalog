require 'json'
require 'pry'
require_relative '../classes/author'
require_relative '../classes/book'
require_relative '../classes/game'
require_relative '../classes/music_album'
class GlobalFunction
  def input(label)
    print "#{label}: "
    gets.chomp
  end

  def save_data(file_name, data_input)
    data_json = []
    data_input.each do |data|
      case file_name
      when 'musicalbum'
        save_albums(data_json, data)
      when 'games'
        save_games(data_json, data)
      end
    end
    File.write("./json/#{file_name}.json", JSON.generate(data_json)) if data_input.any?
  end

  def load_data(file_name)
    my_data = []
    if File.exist?("./json/#{file_name}.json")
      JSON.parse(File.read("./json/#{file_name}.json")).each do |data|
        case file_name
        when 'musicalbum'
          load_album(my_data, data)
        when 'games'
          load_games(my_data, data)
        end
      end
      my_data
    else
      []
    end
  end

  def save_albums(arr, data)
    arr.push({ publish_date: data.publish_date, genre: data.genre.name, genre_id: data.genre.id,
               on_spotify: data.on_spotify })
  end

  def save_games(arr, game)
    arr.push({
               publish_date: game.publish_date,
               multiplayer: game.multiplayer,
               last_played_at: game.last_played_at,
               author: { first_name: game.author.first_name, last_name: game.author.last_name }
             })
  end

  def load_album(arr, data)
    album = MusicAlbum.new(publish_date: data['publish_date'], on_spotify: data['on_spotify'])
    genre = Genre.new(name: data['genre'])
    album.genre = genre
    arr.push(album)
  end

  def load_games(arr, data)
    games = Game.new(data['last_played_at'], data['multiplayer'], publish_date: data['publish_date'])
    author = Author.new(data['author']['first_name'], data['author']['last_name'])
    games.author = author
    arr.push(games)
  end
end
