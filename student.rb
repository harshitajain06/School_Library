require_relative 'person'

class Student < Person
  attr_accessor :classroom, :parent_permission, :id
  attr_reader :json_class

  def initialize(age, classroom, name, parent_permission: true, id: nil, json_class: 'Student')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @id = id
    @json_class = json_class
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
