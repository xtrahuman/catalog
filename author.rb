require_relative 'items'
class Author
  attr_accessor :items, :first_name, :last_name
  attr_reader :id

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    items << item
    item.author = self
  end
end
gg = Author.new('gg', 'www')
ff = Item.new('22')
gg.add_item(ff)
gg.add_item(ff)
puts gg.items.map
