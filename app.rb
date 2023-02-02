require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def start
    option_case
  end

  def all_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    else
      puts 'No books found'
    end
  end

  def all_people
    @people.each do |person|
      puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp
    case person_type
    when '1'
      student_case
    when '2'
      teacher_case
    else
      puts 'Please insert valid number'
      create_person
    end
  end

  def student_case
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [y/n]:'
    permission = gets.chomp.downcase
    permission = permission == 'y'
    student = Student.new(age, name, permission, nil)
    @people << student
    puts 'Student created successfully'
  end

  def teacher_case
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    rental_book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}], Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    rental_person = @people[person_index]
    puts 'Date:'
    date = gets.chomp
    @rental << Rental.new(date, rental_book, rental_person)
    puts 'Rental created successfully'
  end

  def all_rentals_for_id
    puts 'ID of person:'
    rental_id = gets.chomp.to_i
    rentals = @rental.select { |rental| rental.person.id == rental_id }
    puts 'Rental: '
    rentals.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.person.name}" }
  end
end
