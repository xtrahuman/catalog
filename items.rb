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
   true
  end

  def move_to_archive?
    if can_be_archived?
      @archived = true
    end
  end

end
