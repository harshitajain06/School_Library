class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = "Unknown", parent_permission = true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def is_of_age?
    @age >= 18
  end
end
