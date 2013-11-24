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

  it "should return the discounted price for an item on clearance 
  if given item and discount" do
    expect(clearance_discount("AVOCADO", 0.2)).to eq(2.4)
  end
  
end

describe "#on_clearance?" do

  it "should return true if the item its checking is on clearance" do
    expect(on_clearance?("AVOCADO")).to eq(true)
  end
  
end

describe "#two_coupons?" do
  test_coups = [
                 {
                  :item => "BEER",
                  :num => 2,
                  :cost => 20.0
                  },

                  {
                  :item => "ALMONDS",
                  :num => 1,
                  :cost => 10
                  }
                ]

  it "should return true if an item which is inputted has 
  more than two coupons" do
    expect(two_coupons?("BEER", test_coups)).to eq(true)
  end
  it "should return false if the item doesn't have two or more coupons" do
    expect(two_coupons?("ALMONDS", test_coups)).to eq(false)
  end
end

describe "#coup_discount" do

  it "should return the correct price of the item(s) when coupon is applied" do 
    expect(coup_discount("AVOCADO", 2)).to eq(5.0)
    expect(coup_discount("AVOCADO", 3)).to eq(5.0 + 3.0)
    expect(coup_discount("CHEESE", 6)).to eq(15.0 + 15.0)
  end
end

# describe "#checkout" do 
  
#   cart = [
#        {
#         "AVOCADO" => {
#                 :price => 3.0,
#             :clearance => true
#         },
#            :count => 2
#     },
#        {
#         "CHEESE" => {
#                 :price => 6.5,
#             :clearance => false
#         },
#           :count => 1
#     }
# ]

# coupons = [
#        {
#         :item => "AVOCADO",
#          :num => 2,
#         :cost => 5.0
#      }
# ]

#   coupons = generateCoups

#   it "should return the total price for a cart of items with all coupons and clearances applied" do 
#     expect(checkout(cart, coupons)).to eq(11.50)
#   end
# end









