#random_cart_spec.rb

require './random_cart'

describe "#consolidateCart" do

  example_cart = [  
              {  "AVOCADO" => {:price => 3.00, :clearance => true}  }, 
              {  "AVOCADO" => {:price => 3.00, :clearance => true}  }
            ]

  return_cart = [
              {"AVOCADO" => {:price => 3.00, :clearance => true}, :count => 2}
            ]

  it "should return a cart in which every item hash has a :count key that tells you
  how many of those items are in the cart, and has no duplicate item hashes" do
    expect(consolidateCart(example_cart)).to eq(return_cart)
  end
  
end


describe "#in_coups?" do

  it "should return true if item is in COUPS and false if isnt" do
    expect(in_coups?("AVOCADO")).to eq(true)
    expect(in_coups?("ALMONDS")).to eq(false)
  end
  
end

describe "#clearance_discount" do

  it "should return the discounted price (20% off) for an item on clearance" do
    expect(clearance_discount(100)).to eq(80)
  end
  
end

