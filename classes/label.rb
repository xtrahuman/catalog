class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
    @labels = {
      'Gift' => 'red',
      'New' => 'blue',
      'Active' => 'teal',
      'dbr' => 'red'
    }
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
