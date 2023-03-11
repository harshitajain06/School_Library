require_relative 'app'

def main
  app = App.new
  loop do
    list_of_options
    choice = gets.chomp.to_i
    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_by_person_id
    when 7
      puts 'Exiting the Library Management System. Goodbye!'
      break
    else
      puts 'Invalid choice. Please choose again.'
    end
  end
end

def list_of_options
  puts "\nWhat would you like to do?"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person id'
  puts '7. Quit'
end
main