require './student'
require './teacher'
require './rental'
require './classroom'
require './person'
require './book'
require './data/preservedata'

class App
  def initialize
    @people = load_data('./data/people.json')
    @books = load_data('./data/books.json')
    @rentals = load_data('./data/rental.json')
    @classroom = Classroom.new('Grade 10')
  end

  def list_all_books
    if @books.empty?
      puts 'Oops! the library is empty, please add books'
      return
    end
    @books.each_with_index do |book, index|
      puts "#{index + 1} Title: #{book['title']}, Author: #{book['author']}"
    end
  end

  def list_all_people
    if @people.empty?
      puts 'Oops! no people registered, please add people'
    else
      @people.each_with_index do |person, index|
        puts "#{index + 1}: Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher(2)?....'
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input! Please type 1 or 2'
    end
  end

  def create_student
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp.to_i

    print 'Has Parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase

    student = Student.new(age, @classroom, name, parent_permission: parent_permission == 'y')
    person = Person.new(age, name, parent_permission: true)
    student_data = {
      age: student.age,
      name: student.name,
      id: person.id,
      parent_permission: student.parent_permission
    }
    @people << student_data
    save_data('./data/people.json', @people)
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp.to_i

    print 'Specialization:'
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    person = Person.new(age, name, parent_permission: true)

    teacher_data = {
      age: teacher.age,
      specialization: teacher.specialization,
      name: teacher.name,
      id: person.id
    }
    @people << teacher_data
    save_data('./data/people.json', @people)
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    books = Book.new(title, author)

    books_data = {
      title: books.title,
      author: books.author
    }

    @books << books_data
    save_data('./data/books.json', @books)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      # puts book
      puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
    end

    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index}) #{person['class']} Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental.to_h
    save_data('./data/rental.json', @rentals)
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    rentals = @rentals.filter { |rental| rental['person']['id'] == id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental['date']}, Book: '#{rental['book']['title']}' by #{rental['book']['author']}"
    end
  end
end
