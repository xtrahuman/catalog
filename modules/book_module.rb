# rubocop:disable Layout/LineLength
require '../classes/book'
module BookModule
  def user_input(label)
    print "#{label}: "
    gets.chomp
  end

  def add_book
    puts '-------------------------------'
    puts 'ENTER BOOK DETAILS'
    puts '----\n'
    publish_date = user_input('Date Published')
    publisher = user_input('Publisher')
    cover_state = user_input('Cover State')
    @books.push(Book.new(publish_date, publisher, cover_state))
  end

  def list_books
    puts '-------------------------------'
    puts 'ALL BOOKS'
    puts '----\n'
    puts 'There are no books! Add a new book.' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index} => Date published: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end
end
# rubocop:enable Layout/LineLength
