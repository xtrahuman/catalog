require_relative 'items'
require_relative 'genre'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date:, id: nil, on_spotify: true, archived: false)
    super(publish_date: publish_date, archived: archived, id: id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    if super && @on_spotify
      true
    else
      false
    end
  end
end
