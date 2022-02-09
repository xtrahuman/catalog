class ReadData
  def read_games
    path = 'data/games.json'
    if File.exist?(path)
      JSON.parse(File.read(path), { object_class: OpenStruct })
    else
      gamesjson = []
      File.write(path, JSON.generate(gamesjson))
      @games = gamesjson
    end
  end
end
