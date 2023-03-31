require_relative '../person'

describe Person do
  let(:book) { double('book') }

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        person = Person.new(18, 'fahim')
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age and has parent permission' do
      it 'returns true' do
        person = Person.new(17, 'Ali', parent_permission: true)
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age and does not have 18y age!' do
      it 'Return false if age is 18 or less' do
        person = Person.new(17, 'Khan', parent_permission: false)
        expect(person.of_age?).to eq false
      end
    end

    context 'Return the correct name of the person' do
      it 'Return the correct name of the person' do
        person = Person.new(19, 'Khan', parent_permission: false)
        expect(person.correct_name).to eq('Khan')
      end
    end

    context 'Return an empty rentals array' do
      it 'Initializes an empty rentals array' do
        person = Person.new(19, 'Khan', parent_permission: false)
        expect(person.rentals).to be_empty
      end
    end
  end
end
