require_relative '../classes/musicalbum'
require_relative '../classes/genre'

describe Genre do
  context 'Testing the Genre class' do
    african_giant = MusicAlbum.new('2/05/2019')
    superstar = MusicAlbum.new('20/11/2010')
    dancehall = Genre.new('dancehall')
    dancehall.add_item(superstar)
    dancehall.add_item(african_giant)

    it 'Should Pass all the tests' do
      expect(dancehall.name).to eq 'dancehall'
      expect(dancehall.items.length).to be 2
      expect(dancehall.items.first.publish_date).to eq '20/11/2010'
      expect(dancehall.items[1].publish_date).to eq '2/05/2019'
    end
  end
end
