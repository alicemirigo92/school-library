require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals

  def initialize(age, name, parent_permission: true)
    super()
    @id = rand(1..10_000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end
end
