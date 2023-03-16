require_relative 'classroom'

describe Classroom do
  describe '#initialize' do
    it 'creates a new Classroom object' do
      classroom = Classroom.new('label')
      expect(classroom).to be_an_instance_of Classroom
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new('label')
      student = double('student')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end