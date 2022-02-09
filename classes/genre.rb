class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id: nil)
    @id = Random.rand(1..1000) if id.nil?
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
