# rubocop:disable Style/OptionalBooleanParameter, Naming/PredicateName
require './corrector'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def is_of_age?
    @age >= 18
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end

# rubocop:enable Style/OptionalBooleanParameter, Naming/PredicateName
