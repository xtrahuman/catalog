require_relative 'label'

class
   Item
  attr_reader :genre, :author, :label
  attr_accessor :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
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
    pulished_year = date.split('/')[-1].to_i
    current_year = Date.current.year.to_i
    @publish_date = current_year - pulished_year > 10
  end

  def move_to_archive?
    @archived = true if can_be_archived?
  end
end
