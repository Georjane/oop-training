module Format
  def message_when_empty_for(item)
    puts 'No information available as this list is currently empty' if item.size.zero?
  end

  def book_info_for(book)
    "Title: \"#{book.title}\", Author: #{book.author}"
  end

  def personal_info_for(person)
    "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  def request_biodata
    person_type = ask_for_person_type

    if user_selected_valid person_type
      user_biodata << person_type
    else
      puts "\nInvalid option. Try again\n\n"
      request_biodata
    end
  end

  def permission?
    print 'Has parent permission? [Y/N]: '
    gets.chomp.downcase == 'y'
  end

  def field?
    print 'Specialization: '
    gets.chomp
  end

  def book_details
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    [title, author]
  end

  def rent_from(books)
    puts 'Select a book from the following list by number'

    books.each_with_index do |book, index|
      puts "#{index}) #{book_info_for book}"
    end
    gets.chomp.to_i
  end

  def request_from(people)
    puts "\nSelect a person from the following list by number (not id)"

    people.each_with_index do |person, index|
      puts "#{index}) #{personal_info_for person}"
    end
    gets.chomp.to_i
  end

  private

  def ask_for_person_type
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    gets.chomp
  end

  def user_selected_valid(type)
    %w[1 2].include?(type)
  end

  def user_biodata
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    [age, name]
  end
end
