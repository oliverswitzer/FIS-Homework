#remove_nils_spec
require './remove_nils_solution'

describe "#some_method" do
  
  it "should not return an error" do
    expect(some_method).to_not raise_error
  end
  
  it "should return an the sum of an array 
  that has nils (hardcoded as [1, 4, nil, 9, 16, nil])" do
    expect(some_method).to eq(30)
  end

end