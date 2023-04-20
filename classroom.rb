class Classroom
  attr_accessor :label, :students

  @all = []

  def initialize(label)
    @label = label
    @students = []
    self.class.all << self
  end

  class << self
    attr_reader :all
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
