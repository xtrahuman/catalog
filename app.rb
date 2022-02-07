class App
  def get_num(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_music - albums
    when '3'
      list_all_games
    when '4'
      list_all_genres
    when '5'
      list_all_labels
    when '6'
      list_all_authors
    when '7'
      add_book
    when '8'
      add_music_album
    when '9'
      add_game
    else
      puts 'Please enter a number between 1 and 7.'
    end
  end

  def savedata
    @run_data.save_music
    @run_data.save_books
    @run_data.save_game
  end
end
