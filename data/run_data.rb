class Data
  def initialize(games)
    @games = games
  end

  def save_games
    path = 'data/games.json'
    gamesjson = []
    @games.each do |game|
      gamesjson.push({
                       publish_date: game.publish_date,
                       multiplayer: game.multiplayer,
                       last_played_at: game.last_played_at,
                       author: { first_name: game.author.first_name, last_name: game.author.last_name }
                     })
    end
    File.open(path, 'w') do |file|
      JSON.dump(gamesjson, file)
    end
  end
end
