require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require 'json'

class App
  attr_reader :classrooms, :students, :books, :people, :rentals

  def initialize
    @classrooms = []
    @students = []
    @books = load_books || []
    @people = load_people || []
    @rentals = load_rental || []
  end

  def save_books
    File.open('./data/books.json', 'w') do |f|
      f.write(JSON.pretty_generate(@books))
    end
  end

  def load_books
    if File.exist?('./data/books.json')
      @books = JSON.parse(File.read('./data/books.json'))
    else
      @books = []
    end
  end

  def save_people
    File.open('./data/people.json', 'w') do |f|
      f.write(JSON.pretty_generate(@people))
    end
  end

  def load_people
    if File.exist?('./data/people.json')
      @people = JSON.parse(File.read('./data/people.json'))
    else
      @people = []
    end
  end

  def save_rental
    File.open('./data/rental.json', 'w') do |f|
      f.write(JSON.pretty_generate(@rentals))
    end
  end

  def load_rental
    if File.exist?('./data/rental.json')
      @rentals = JSON.parse(File.read('./data/rental.json'))
    else
      @rentals = []
    end
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book['title']}, Author: #{book['author']}"
    end
  end

  def list_people
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
      save_people

    when '2'
      create_teacher
      save_people
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
    case parent_permission
    when 'y'
      student = Student.new(age, classroom, name, parent_permission: true)
      person = Person.new(age, name, parent_permission: true)
      student_json = {
      age: student.age,
      name: student.name,
      parent_permission: true,
      id: person.id
      }
      @people << student_json
      puts 'Student created successfully'
    when 'n'
      student = Student.new(age, classroom, name, parent_permission: false)
      person = Person.new(age, name, parent_permission: true)
      student_json = {
      age: student.age,
      name: student.name,
      parent_permission: false,
      id: person.id
      }
      @people << student_json
      puts 'Student created successfully'
    else
      puts 'Invalid option'
    end
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
    author: book.author,
    }
    @books << book_json
    puts "Book #{title} created successfully."
    puts @books
  end

  def create_rental
    puts 'select the book you want to rent by entering it\'s number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book['title']}, Author: #{book['author']}" }
    book_id = gets.chomp.to_i
    return puts 'sorry wrong input' unless (0...@books.length).include?(book_id)
    puts 'select person from the list by its number'
    tem_person = @people
    tem_person.each_with_index do |person, index|
      puts "#{index} [#{person['class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_id = gets.chomp.to_i
    unless (0...tem_person.length).include?(person_id)
      puts 'sorry wrong input'
      return
    end
    print 'Date: '
    date = gets.chomp.to_s
    rental = Rental.new(date, tem_person[person_id], @books[book_id])
    rental_json = {
    date: rental.date,
    person_id: rental.person,
    book_id: rental.book
    }
    @rentals << rental_json
    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    puts 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      if rental['person_id']['id'] == id
        puts "Date: #{rental['date']}, Book: #{rental['book_id']['title']} by #{rental['person_id']['name']}"
      else
        puts 'No rentals found for that ID'
      end
    end
  end
end
