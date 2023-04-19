require './decorator'

class TrimmerDecorator < Decorator
  MAXIMUM_NAME_LENGTH = 10

  def correct_name
    name = @nameable.correct_name
    @nameable.correct_name.length > MAXIMUM_NAME_LENGTH ? @nameable.correct_name[0...MAXIMUM_NAME_LENGTH] : @nameable.correct_name
  end
end
