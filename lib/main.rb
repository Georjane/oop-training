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