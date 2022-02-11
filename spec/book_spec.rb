require_relative '../classes/items'
require_relative '../classes/book'

describe Book do
  context 'When testing the book class' do
    before(:each) do
      @book = Book.new('We Publish', 'Bad', publish_date: '12/12/2021')
    end

    it 'should initialize a Book object with a publisher, publish date, cover state and otheras' do
      expect(@book.publish_date).to eq('12/12/2021')
      expect(@book.publisher).to eq('We Publish')
      expect(@book.cover_state).to eq('Bad')
    end

    it 'should return nil for parent variables' do
      expect(@book.author).to eq nil
      expect(@book.genre).to eq nil
      expect(@book.label).to eq nil
    end
  end
end
