require_relative '../trimmer_decorator'
require_relative '../capitalize_decorator'

RSpec.describe TrimmerDecorator do
  describe '#correct_name' do
    let(:nameable) { double('nameable', correct_name: 'Khan') }
    let(:decorator) { TrimmerDecorator.new(nameable) }

    it 'returns the full name when it is shorter than the maximum length' do
      expect(decorator.correct_name).to eq('Khan')
    end

    it 'returns a truncated name when it is longer than the maximum length' do
      nameable = double('nameable', correct_name: 'Fahim Khan Wardak')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Fahim Khan')
    end

    it 'returns an empty string when the decorated object returns an empty string' do
      nameable = double('nameable', correct_name: '')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('')
    end
  end
end

describe CapitalizeDecorator do
  describe '#correct_name' do
    let(:nameable) { double('nameable', correct_name: 'fahim') }
    let(:decorator) { CapitalizeDecorator.new(nameable) }

    it 'capitalizes the first letter of the name' do
      expect(decorator.correct_name).to eq('Fahim')
    end

    it 'does not modify names that are already capitalized' do
      nameable = double('nameable', correct_name: 'Fahim')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Fahim')
    end

    it 'returns an empty string when the decorated object returns an empty string' do
      nameable = double('nameable', correct_name: '')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('')
    end
  end
end
