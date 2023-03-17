require_relative '../decorator'
describe NameDecorator do
  describe '#correct_name' do
    it 'calls the correct_name method of the decorated object' do
      nameable = instance_double(Nameable, correct_name: 'Maximilianus')
      decorator = NameDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Maximilianus')
    end
  end
end
describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the name of the decorated object' do
      nameable = instance_double(Nameable, correct_name: 'maximilianus')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Maximilianus')
    end
  end
end
describe TrimmerDecorator do
  describe '#correct_name' do
    it 'trims the name of the decorated object to a maximum length' do
      nameable = instance_double(Nameable, correct_name: 'Maximilianus')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name.length).to be <= TrimmerDecorator::MAX_LENGTH
    end
  end
end
describe Person do
  describe '#correct_name' do
    it 'returns the name of the person object' do
      person = Person.new(22, 'Maximilianus')
      expect(person.correct_name).to eq('Maximilianus')
    end
  end
end
