require_relative '../associations'

describe Classroom do
  describe '#initialize' do
    it 'creates a new Classroom object' do
      classroom = Classroom.new('label')
      expect(classroom).to be_an_instance_of Classroom
    end
  end
end