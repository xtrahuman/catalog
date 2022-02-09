require_relative '../classes/musicalbum'
require_relative '../classes/genre'

describe MusicAlbum do
  context 'Testing the MusicalAlbum class' do
    african_giant = MusicAlbum.new('2/05/2019')
    dancehall = Genre.new('dancehall')
    african_giant.genre = dancehall

    it 'Should Pass all the tests' do
      expect(african_giant.publish_date).to eq '2/05/2019'
      expect(african_giant.can_be_archived?).to be false
    end
  end
end
