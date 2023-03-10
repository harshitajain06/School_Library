# Interface
class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

# Base Decorator
class NameDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# CapitalizeDecorator
class CapitalizeDecorator < NameDecorator
  def correct_name
    super.capitalize
  end
end

# TrimmerDecorator
class TrimmerDecorator < NameDecorator
  MAX_LENGTH = 10

  def correct_name
    super[0..MAX_LENGTH - 1]
  end
end

# Person class decorated with Capitalize and Trimmer decorators
class Person < Nameable
  attr_accessor :name, :age
  def initialize(age, name)
    super()
    @name = name
    @age = age
  end

  def correct_name
    @name
  end
end



person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmedperson = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmedperson.correct_name
