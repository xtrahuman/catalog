require_relative './classes/musicalbum'
require_relative './classes/genre'
require 'json'

module SaveMusicData

  def list_saved_albums
    file = 'musicalbums.json'
    my_albums = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |data|
        album = MusicAlbum.new(publish_date: data['publish_date'], id: data['album_id'])
        genre = Genre.new(name: data['genre'], id: data['genre_id'])
        album.genre = genre
        my_albums.push(album)
      end
      my_albums
    else
      []
    end
  end

  def list_all_genres
    file = 'genres.json'
    if File.exist(file)
      JSON.parse(File.read(file)).map do |data|
        Genre.new(data.genre)
      end
    else
      []
    end
  end

  def save_all_music_albums
    musicalbum_json = []
    @albums.each do |data|
      musicalbum_json.push({ publish_date: data.publish_date, album_id: data.id, genre: data.genre.name, genre_id: data.genre.id })
    end
    File.write('musicalbums.json', JSON.generate(musicalbum_json))
  end

  def save
    save_all_music_albums unless @albums.empty?
  end

end
