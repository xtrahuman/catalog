require 'date'

class Item
  attr_reader :genre, :author, :label, :id
  attr_accessor :publish_date

  def initialize(publish_date:, id: nil, archived: false)
    @id = Random.rand(1...1000) if id.nil?
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @label = label
    @label.items.push(self) unless @label.items.include?(self)
  end

  def author=(author)
    @author = author
    @author.items.push(self) unless @author.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.items.push(self) unless @genre.items.include?(self)
  end

  def can_be_archived?
    pulished_year = @publish_date.split('/')[-1].to_i
    current_year = Date.today.year.to_i
    current_year - pulished_year > 10
  end

  def move_to_archive?
    @archived = true if can_be_archived?
  end
end
