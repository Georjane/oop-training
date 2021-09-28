require './app'

def main
  app = App.new

  response = nil

  puts "Welcome to School Library App!\n\n"

  while response != '7'
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    response = gets.chomp

    case response
    when '1'
      app.list_of_books
    when '2'
      app.list_of_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_of_rentals_for_person_id
    when '7'
      puts 'Thank you for using this app!'
    end
    puts "\n"
  end
end

main
