require './decorator'

class TrimmerDecorator < Decorator
  MAXIMUM_NAME_LENGTH = 10

  def correct_name
    # name = @nameable.correct_name
    name.length > MAXIMUM_NAME_LENGTH ? name[0...MAXIMUM_NAME_LENGTH] : name
  end
end
