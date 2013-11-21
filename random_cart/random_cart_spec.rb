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