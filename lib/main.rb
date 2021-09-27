class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end


  def list_of_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end


  def list_of_people
    @people.each do |person|
       puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "


    person_type = gets.chomp
    if person_type != "1" && person_type != "2"
      puts "Not a valid option"
      return
    end

    print "Age: "
    age = gets.chomp

    print "Name: "
    name = gets.chomp

    person =
      if person_type == "1"
        print "Has parent permission? [Y/N]: "
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == "y"

        Student.new(age, name, parent_permission)
      elsif person_type == "2"
        print "Specialization: "
        specialization = gets.chomp

        Teacher.new(age, specialization, name)
      end

    @people << person
    puts "Person created successfully"
  end





end