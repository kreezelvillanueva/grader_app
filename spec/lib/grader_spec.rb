require "grader"
require "tempfile"

RSpec.describe Grader do
  let(:csv_data) do
    <<~CSV
      first_name,last_name,age,english,math,physics
      Billy,Joel,14,92,88,85
      Omar,Hassan,15,78,98,95
      Ashley,Bubble,15,85,90,91
    CSV
  end

  let(:tempfile) do
    file = Tempfile.new("grades.csv")
    file.write(csv_data)
    file.rewind
    file
  end

  subject(:grader) { Grader.new(tempfile.path) }

  after do
    tempfile.close
    tempfile.unlink
  end

  it "creates an array of Student objects" do
    expect(grader.students).to all(be_a(Student))
  end

  it "extracts the correct subjects" do
    expect(grader.subjects.map(&:capitalize)).to eq(["English", "Math", "Physics"])
  end

  it "parses student names correctly" do
    expect(grader.students.map(&:name)).to eq(["Billy Joel", "Omar Hassan", "Ashley Bubble"])
  end

  it "parses student grades correctly" do
    expect(grader.students.map(&:grades)).to eq([
      [92, 88, 85], 
      [78, 98, 95], 
      [85, 90, 91]
    ])
  end

  it "calculates correct averages" do
    expect(grader.students.map(&:average)).to eq([88, 90, 88])
  end
end
