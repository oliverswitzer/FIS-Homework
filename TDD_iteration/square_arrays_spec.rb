#square_arrays_spec.rb
require './square_arrays_solution'

describe "#square_array" do

  it "should take an array as the parameter and return a new
   array with every element in the old array squared" do
   expect(square_array([2, 3, 4])).to eq([4, 9, 16])
 end

end