require_relative 'app'
require_relative 'choose'
require_relative 'storage'

include SaveData
include LoadData

def main
  app = App.new
  choose = Choose.new
  loop do
    display_menu_options
    choice = gets.chomp.to_i
    choose.handle_menu_choice(choice, app)
    break if choice == 7
  end
  puts 'Exiting the Library Management System. Goodbye!'
end

def display_menu_options
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
