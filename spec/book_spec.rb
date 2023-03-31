require 'rspec'
require_relative '../book'
require_relative '../person'

describe Book do
  before :each do
    @book = Book.new('Ruby', 'Khan')
    @person = Person.new(23)
  end

  context 'Creating a book' do
    it 'Should create an instance of the book' do
      expect(@book).to be_an_instance_of Book
    end

    it 'Should create an instance of the book' do
      expect(@person).to be_an_instance_of Person
    end

    it 'Should return title and author' do
      expect @book.title.should eql 'Ruby'
      expect @book.author.should eql 'Khan'
    end
  end
end
