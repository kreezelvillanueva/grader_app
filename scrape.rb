require "grader"
require "terminal-table"

file = File.open("./files/grades.csv")
grader = Grader.new(file)

table = Terminal::Table.new do |t|
  t << ["Name"] + grader.subjects.map(&:capitalize) + ["Average"]

  grader.students.each do |student|
    t.add_separator
    t << [student.name] + student.grades + [student.average]
  end
end

puts table
