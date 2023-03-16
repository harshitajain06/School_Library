require_relative 'person'

describe Person do
  let(:book) { double("book") }

  describe "#add_rental" do
    it "creates a new rental for the person and book" do
      person = Person.new(20, "John")
      rental = person.add_rental("2023-03-16", book)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
      expect(rental.date).to eq("2023-03-16")
    end
  end

  describe "#correct_name" do
    it "corrects the name of the person" do
      person = Person.new(20, "joHN")
      expect(person.correct_name).to eq("John")
    end
  end

  describe "#can_use_services?" do
    context "when the person is of age" do
      it "returns true" do
        person = Person.new(18, "John")
        expect(person.can_use_services?).to be true
      end
    end

    context "when the person is not of age and has parent permission" do
      it "returns true" do
        person = Person.new(17, "John", parent_permission: true)
        expect(person.can_use_services?).to be true
      end
    end

    context "when the person is not of age and does not have parent permission" do
      it "returns false" do
        person = Person.new(17, "John", parent_permission: false)
        expect(person.can_use_services?).to be false
      end
    end
  end
end
