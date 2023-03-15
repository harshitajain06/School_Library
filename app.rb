require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require './data/preservedata'

class App
  attr_reader :classrooms, :students, :books, :people, :rentals

  def initialize
    @classrooms = []
    @books = load_data('./data/books.json')
    @people = load_data('./data/people.json')
    @rentals = load_data('./data/rental.json')
  end

  def list_books
    @books = load_data('./data/books.json')
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book['title']}, Author: #{book['author']}"
    end
  end

  def list_people
    @people = load_data('./data/people.json')
    puts 'All people:'
    @people.each_with_index do |person, index|
      puts "#{index + 1}. Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp

    case person_type

    when '1'
      create_student

    when '2'
      create_teacher
    else
      puts 'Invalid option.'
    end
  end

  def create_teacher
    puts 'Create a New Teacher'
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    person = Person.new(age, name, parent_permission: true)
    teacher_json = {
      age: teacher.age,
      specialization: teacher.name,
      name: teacher.name,
      id: person.id
    }
    @people << teacher_json
    save_data('./data/people.json', @people)
    puts 'Teacher created successfully'
  end

  def create_student
    puts 'Create a New Student'
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    classroom = 2
    puts 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase
    student = Student.new(age, classroom, name, parent_permission: parent_permission)
    person = Person.new(age, name, parent_permission: true)
    student_json = {
      age: student.age,
      name: student.name,
      parent_permission: parent_permission,
      id: person.id
    }
    @people << student_json
    save_data('./data/people.json', @people)
    puts 'Student created successfully'
  end

  def create_book
    puts 'create a new book'
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    book_json = {
      title: book.title,
      author: book.author
    }
    @books << book_json
    save_data('./data/books.json', @books)
    puts "Book #{title} created successfully."
    puts @books
  end

  def create_rental
    puts 'select the book you want to rent by entering it\'s number'
    @books = load_data('./data/books.json')
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book['title']}, Author: #{book['author']}" }
    book_id = gets.chomp.to_i
    @people = load_data('./data/people.json')
    puts 'select person from the list by its number'
    @people.each_with_index do |person, index|
      puts "#{index} Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_id = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp.to_s
    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental.to_h
    save_data('./data/rental.json', @rentals)
    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    puts 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals = load_data('./data/rental.json')
    @rentals.each do |rental|
      if rental['person_id']['id'] == id
        puts "Date: #{rental['date']}, Book: #{rental['book_id']['title']} by #{rental['person_id']['name']}"
      else
        puts 'No rentals found for that ID'
      end
    end
  end
end
