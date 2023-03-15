class Choose
  def handle_menu_choice(choice, app)
    case choice
    when 1
      app.load_books
      app.list_books
    when 2
      app.load_people
      app.list_people
    when 3
      app.create_person
      app.save_people
    when 4
      app.create_book
      app.save_books
    when 5
      app.create_rental
      app.save_rental
    when 6
      app.load_rental
      app.list_rentals_by_person_id
    else
      puts 'Invalid choice. Please choose again.'
    end
  end
end
