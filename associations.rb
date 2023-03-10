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

class Student
  attr_accessor :name, :classroom

  def initialize(name)
    @name = name
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
end

class Person
  attr_accessor :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end
end
