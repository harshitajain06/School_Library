class Choose
  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_menu_choice(choice, app)
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
      puts 'Thanks for using the school library App!'
      exit
    else
      puts 'Invalid choice. Please choose again.'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
