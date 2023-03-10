require_relative 'decorator'

class Person < Nameable
  attr_reader :id, :rental
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    super()
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    if of_age || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
