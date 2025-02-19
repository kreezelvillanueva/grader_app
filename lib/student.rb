class Student
  attr_reader :name, :grades, :average

  def initialize(name, grades)
    @name = name
    @grades = grades
    @average = calculate_average
  end

  private

  def calculate_average
    (@grades.sum / @grades.size)
  end
end
  