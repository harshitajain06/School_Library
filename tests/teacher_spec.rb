require_relative 'teacher'

describe Teacher do
  let(:teacher) { Teacher.new(35, 'Mathematics', 'John Doe') }

  describe '#initialize' do
    it 'should create a Teacher object with age, specialization, name, and parent permission' do
      expect(teacher).to be_an_instance_of Teacher
      expect(teacher.age).to eq 35
      expect(teacher.name).to eq 'John Doe'
      expect(teacher.specialization).to eq 'Mathematics'
      expect(teacher.parent_permission).to eq true
    end
  end

  describe '#can_use_services?' do
    it 'should return true' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
