class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end

  def to_h
    {
      date: @date,
      book: @book.to_h,
      person: @person.to_h
    }
  end
end
