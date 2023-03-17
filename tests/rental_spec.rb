require_relative '../rental'

describe Rental do
  describe '#initialize' do
    it 'creates a new Rental object' do
      rental = Rental.new('date', 'person', 'book')
      expect(rental).to be_an_instance_of Rental
    end
  end

  describe '#to_h' do
    it 'returns a hash of the rental object' do
      book = double('book', to_h: {})
      person = double('person', to_h: {})
      rental = Rental.new('date', person, book)
      expect(rental.to_h).to eq({ date: 'date', book: {}, person: {} })
    end
  end
end
