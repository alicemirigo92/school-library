require './decorator'

class TrimmerDecorator < Decorator
  MAXIMUM_NAME_LENGTH = 10

  def correct_name
    if @nameable.correct_name.length > MAXIMUM_NAME_LENGTH
      @nameable.correct_name[0...MAXIMUM_NAME_LENGTH]
    else
      @nameable.correct_name
    end
  end
end
