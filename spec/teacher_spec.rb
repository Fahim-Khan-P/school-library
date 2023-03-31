require_relative '../teacher'

describe Teacher do
  describe '#initialize' do
    it 'creates a new Teacher object' do
      teacher = Teacher.new(10, 'Math', 'Tonny')
      expect(teacher).to be_an_instance_of Teacher
    end
  end
end
