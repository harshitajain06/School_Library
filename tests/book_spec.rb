require_relative '../book'

describe Book do
  let(:book) { Book.new('The Catcher in the Rye', 'J.D. Salinger') }
  let(:person) { double('person') }
  let(:date) { Date.today }

  describe '#initialize' do
    it 'creates a book with a title and an author' do
      expect(book.title).to eq('The Catcher in the Rye')
      expect(book.author).to eq('J.D. Salinger')
    end

    it 'creates a book with an empty rentals array' do
      expect(book.rentals).to eq([])
    end
  end
end
