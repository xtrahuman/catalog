require_relative 'game'

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
    puts "------------------------"
    last_played = input('last_played_at (in date format e.g 2/2/22)')
    multiplayer = input('multiplayer (in strings e.g xtrahuman)')
    publish_date = input('publish_date (in date format e.g 2/2/22)')
    @games.push(Game.new(last_played, multiplayer, publish_date))
  end

  def list_all_games
    puts 'there are no games! kindly add some games' if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index} => Date published: #{game.publish_date}"
      puts "Player: #{game.multiplayer}, last played: #{game.last_played_at}"
    end
  end
end
