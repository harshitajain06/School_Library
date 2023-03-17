require_relative '../teacher'

describe Teacher do
  describe '#initialize' do
    it 'creates a new Teacher object' do
      teacher = Teacher.new(30, 'specialization', 'name')
      expect(teacher).to be_an_instance_of Teacher
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new(20, 'coding', 'Harshita')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
