#max_solution_spec.rb
require './max_solution'

describe "#maximum" do
  
  it "should return the largest number in an array" do
    expect(maximum([1, 2, 7, 4, 5])).to eq(7)
  end

  it "should return the largest number in an array" do
    expect(maximum([70, 2, 43, 9, 21])).to eq(70)
  end

end

describe Array, "#maximum" do

  it "should return the largest number in the Array object it is called on" do
    [1, 4, 5, 1, 1, 0].maximum.should eq(5)
  end

end