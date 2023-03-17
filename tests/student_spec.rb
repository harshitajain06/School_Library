require_relative '../student'

describe Student do
  describe '#initialize' do
    it 'creates a new Student object' do
      student = Student.new(18, 'classroom', 'name')
      expect(student).to be_an_instance_of Student
    end
  end

  describe '#play_hooky' do
    it 'returns a shrug emoji' do
      student = Student.new(18, 'classroom', 'name')
      expect(student.play_hooky).to eq('¯\\_(ツ)_/¯')
    end
  end
end
