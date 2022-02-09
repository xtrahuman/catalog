require_relative '../classes/game'
require_relative '../classes/author'
require_relative './global'

class GameFunction
  def initialize(games)
    @games = games
    @global = GlobalFunction.new
  end

  def add_game
    puts '------------------------'
    puts 'Enter Game details below'
    puts '------------------------'
    last_played = @global.input('Last Played At [format: d/m/yyyy]')
    multiplayer = @global.input('Multiplayer')
    publish_date = @global.input('Date Published [format: d/m/yyyy]')
    first_name = @global.input('Author First Name')
    last_name = @global.input('Author Last Name')
    author = Author.new(first_name, last_name)
    item = Game.new(last_played, multiplayer, publish_date)
    author.add_item(item)
    @games.push(item)
    puts 'Game Created Successfully'
  end

  def list_all_games
    puts 'There are no games! Kindly add some games' if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index} => Date published: #{game.publish_date}"
      puts "Player: #{game.multiplayer}, last played: #{game.last_played_at}"
    end
  end

  def list_all_authors
    puts 'There are no authors!' if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index} => Date published: #{game.publish_date} author: #{game.author.first_name} #{game.author.last_name}"
    end
  end
end
