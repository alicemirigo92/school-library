# require './nameable'

# class Person < Nameable
#   def initialize(age, name, parent_permission: true)
#     super()
#     @age = age
#     @name = name
#     @parent_permission = parent_permission
#   end

#   attr_reader :id
#   attr_accessor :name, :age

#   def correct_name
#     @name
#   end

#   private

#   def is_of_age?
#     @age >= 18
#   end

#   def can_use_services?
#     @parent_permission || is_of_age?
#   end
# end