require_relative '../game'

describe Game do
  context 'When testing the game class' do
    before(:each) do
      @game = Game.new('10/10/2022', 'xtra', '10/20/1998')
    end

    it 'should initialize a game object with a last_played_at, multiplayer, publish_date' do
      expect(@game.last_played_at).to eq('10/10/2022')
      expect(@game.multiplayer).to eq('xtra')
      expect(@game.publish_date).to eq('10/20/1998')
    end

    it 'should return nil for parent variables not in game' do
      expect(@game.author).to eq nil
      expect(@game.genre).to eq nil
      expect(@game.label).to eq nil
    end
  end
end
