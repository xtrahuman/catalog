require_relative '../classes/book'
require_relative '../classes/label'
require_relative './global'

class BookFuction
  def initialize(books)
    @books = books
    @global = GlobalFunction.new
  end

  def add_book
    puts '------------------------'
    puts 'Enter Book details below'
    puts '------------------------'
    publish_date = @global.input('Date Published [format: d/m/yyyy]')
    publisher = @global.input('Publisher')
    cover_state = @global.input('Cover State [options: bad, good]')
    title = @global.input('Label title')
    color = @global.input('Label color')
    label = Label.new(title, color)
    book = Book.new(publisher, cover_state, publish_date: publish_date)
    label.add_item(book)
    @books.push(book)
    puts 'Book Created Successfully'
  end

  def list_all_books
    puts 'There are no books! Kindly add some books.' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index} => Date published: #{book.publish_date}"
      puts "Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def list_all_labels
    puts 'There are no labels!' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index} => Date published: #{book.publish_date}"
      puts "Title: #{book.label.title}, Color: #{book.label.color}"
    end
  end
end
