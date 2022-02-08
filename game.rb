require_relative 'items'

class Game < Item
  attr_accessor :last_played_at
  attr_reader :multiplayer

  def initialize(last_played_at, multiplayer, publish_date, archived: false)
    super(publish_date, archived: archived)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super true and @last_played_at > 2
  end
end
