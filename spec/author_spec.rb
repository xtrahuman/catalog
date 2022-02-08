require_relative '../author'
require_relative '../items'

describe Author do
  context 'It should create rental' do
    author1 = Author.new('john', 'bull')
    item1 = Item.new('2/2/2')
    it 'should check rental data' do
      author1.add_item(item1)
      expect(author1.first_name).to eq 'john'
      expect(item1.author.first_name).to eq 'john'
    end
  end
end
