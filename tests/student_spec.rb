require 'rspec'

describe Student do
  let(:age) { 10 }
  let(:classroom) { '5A' }
  let(:name) { 'John Doe' }
  let(:student) { described_class.new(age, classroom, name) }

  describe '#initialize' do
    it 'should initialize a student object with the given attributes' do
      expect(student.age).to eq(age)
      expect(student.name).to eq(name)
      expect(student.classroom).to eq(classroom)
      expect(student.parent_permission).to be(true)
    end
  end

  describe '#play_hooky' do
    it 'should return a string' do
      expect(student.play_hooky).to be_a(String)
    end

    it 'should return the correct string' do
      expect(student.play_hooky).to eq('¯\\_(ツ)_/¯')
    end
  end
end
