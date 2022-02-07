class Item
  attr_reader :genre, :author, :source, :label
  attr_accessor :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @label = label
    @label.items.push(self) unless @label.items.include?(self)
  end
end
