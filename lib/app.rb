require './book'
require './student'
require './teacher'
require './rental'
require './format'
require 'date'

class App
  include Format

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_of_books
    message_when_empty_for @books

    @books.each do |book|
      puts book_info_for book
    end
  end

  def list_of_people
    message_when_empty_for @people

    @people.each do |person|
      puts personal_info_for person
    end
  end

  def create_person
    age, name, person_type = request_biodata

    person =
      case person_type
      when '1'
        parent_permission = permission?
        Student.new(age, parent_permission, name)
      when '2'
        specialization = field?
        Teacher.new(age, specialization, name)
      end

    @people << person
    puts 'Person created successfully'
  end

  def create_book
    title, author = book_details
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    return unless rental_possible?(@books, @people)

    book_index = rent_from @books
    person_index = request_from @people
    date = Date.today

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_of_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end

private

def rental_possible?(*lists)
  lists.all? { |list| list.size.positive? }
end
