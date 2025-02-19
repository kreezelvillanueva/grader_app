require "csv"
require "student"

class Grader
  attr_reader :students, :subjects

  def initialize(file)
    @students = []
    parse_csv(file)
  end

  private

  def parse_csv(file)
    csv = CSV.read(file, headers: true)
    @subjects = csv.headers.map(&:downcase).reject { |header| header.include?("name") ||
                                                              header.include?("age") }
    csv.each do |row|
      name = "#{row["first_name"]} #{row["last_name"]}"
      grades = @subjects.map { |subject| row[subject].to_i }
      @students << Student.new(name, grades)
    end
  end
end
