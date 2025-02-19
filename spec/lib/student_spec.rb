require "student"

RSpec.describe Student do
  subject(:student) { Student.new("Billy Joel", [92, 88, 85]) }

  it "stores the name correctly" do
    expect(student.name).to eq("Billy Joel")
  end

  it "stores grades correctly" do
    expect(student.grades).to eq([92, 88, 85])
  end

  it "calculates the correct average" do
    expect(student.average).to eq(88)
  end
end
