require_relative 'rental'

describe Rental do
  let(:date) { '2022-01-01' }
  let(:person) { double('person') }
  let(:book) { double('book') }
  subject { described_class.new(date, person, book) }

  describe '#to_h' do
    it 'returns a hash with date, book, and person' do
      expect(subject.to_h).to eq({
        date: date,
        book: book.to_h,
        person: person.to_h
      })
    end
  end
end