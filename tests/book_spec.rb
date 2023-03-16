require_relative 'book'

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

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      rental = book.add_rental(person, date)
      expect(book.rentals).to include(rental)
    end

    it 'returns a new Rental object' do
      rental = book.add_rental(person, date)
      expect(rental).to be_a(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
    end
  end
end
