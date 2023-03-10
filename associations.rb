class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end

class Student < Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

class Rental
  attr_accessor :book, :person, :date

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
    @book.rentals << self
    @person.rentals << self
  end
end

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end

class Person
  attr_accessor :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
