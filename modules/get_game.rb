require_relative '../classes/game'
require_relative '../classes/author'

class AllGame
  def initialize(games)
    @games = games
  end

  def input(details)
    puts "enter #{details}"
    gets.chomp
  end

  def add_game
    puts '------------------------'
    puts 'enter game details below'
    puts '------------------------'
    last_played = input('last_played_at (in date format e.g 2/2/22)')
    multiplayer = input('multiplayer (in strings e.g xtrahuman)')
    publish_date = input('publish_date (in date format e.g 2/2/22)')
    first_name = input('first_name of Game author')
    last_name = input('last name of Game author')
    author = Author.new(first_name, last_name)
    item = Game.new(last_played, multiplayer, publish_date)
    author.add_item(item)
    @games.push(item)
  end

  def list_all_games
    puts 'there are no games! kindly add some games' if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index} => Date published: #{game.publish_date}"
      puts "Player: #{game.multiplayer}, last played: #{game.last_played_at}"
    end
  end

  def list_all_authors
    puts 'there are no authors!' if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index} => Date published: #{game.publish_date} author: #{game.author.first_name} #{game.author.last_name}"
    end
  end
end
