require_relative '../teacher'

describe Teacher do
  describe '#initialize' do
    teacher = Teacher.new(19, 'Math', 'Tonny', true)
    it 'should create a teacher' do
      expect(teacher).to be_an_instance_of Teacher
    end
  end
end
