require_relative '../person'

describe Person do
  let(:book) { double('book') }

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        person = Person.new(18, 'John')
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age and has parent permission' do
      it 'returns true' do
        person = Person.new(17, 'John', parent_permission: true)
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age and does not have parent permission' do
      it 'returns false' do
        person = Person.new(17, 'John', parent_permission: false)
        expect(person.can_use_services?).to be false
      end
    end
  end
end
