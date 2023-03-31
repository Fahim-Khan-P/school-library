require_relative '../classroom'
require_relative '../student'

describe Classroom do
  describe '#initialize' do
    it 'creates a new Classroom object' do
      @classroom = Classroom.new('label')
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  context 'return non empty array!' do
    it 'adds student to classroom' do
      student = Student.new(12, 'A', 'Khan')
      @classroom = Classroom.new('label')
      @classroom.add_student(student)
      expect(@classroom.students).not_to be_empty
    end
  end
end
