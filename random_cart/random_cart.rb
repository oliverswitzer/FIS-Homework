require 'awesome_print'


# array of hashes --> hash with one key in it (item) --> value of
# that one thing is another hash --> that hash contains both price
  # and clearance
ITEMS = [  {"AVOCADO" => {:price => 3.00, :clearance => true}},
          {"KALE" => {:price => 3.00,:clearance => false}},
          {"BLACK_BEANS" => {:price => 2.50,:clearance => false}},
          {"ALMONDS" => {:price => 9.00, :clearance => false}},
          {"TEMPEH" => {:price => 3.00,:clearance => true}},
          {"CHEESE" => {:price => 6.50,:clearance => false}},
          {"BEER" => {:price => 13.00, :clearance => false}},
          {"PEANUTBUTTER" => {:price => 3.00,:clearance => true}},
          {"BEETS" => {:price => 2.50,:clearance => false}}]

COUPS = [  {:item=>"AVOCADO", :num=>2, :cost=>5.00},
          {:item=>"BEER", :num=>2, :cost=>20.00},
          {:item=>"CHEESE", :num=>3, :cost=>15.00}]

# ap ITEMS
# ap COUPS
#randomly generates a cart of items
def generateCart
  cart = []
  rand(20).times do
      cart.push(ITEMS.sample)  
  end
  cart
end

#randomly generates set of coupons
def generateCoups
  coups = []
  rand(2).times do
    coups.push(COUPS.sample)
  end
  coups
end


def consolidateCart cart
  uniq_item_list = cart.uniq  #this is a array of unique items
  count_hash = {}  # this is to keep track of the count corresponding to each item
  uniq_item_list.each do |item|  #for each item on the unique list
     count = cart.select {|hash_items| hash_items == item}.size   #set count = to the size of a select statement
     count_hash[item] = count                                     #on the original cart
   end
   uniq_cart = cart.uniq   #wipe out duplicates in the cart
   uniq_cart.each do |item_hash|   #for each item in the unique cart
    item_hash[:count] = count_hash[item_hash]   #add a key :count which has a value pulled from our count_hash
  end
  uniq_cart #return our uniq grocery cart!
end


rand_cart = [  
              {  "AVOCADO" => {:price => 3.00, :clearance => true}  }, 
              {  "AVOCADO" => {:price => 3.00, :clearance => true}  },
              {  "AVOCADO" => {:price => 3.00, :clearance => true}  }, 
              {  "AVOCADO" => {:price => 3.00, :clearance => true}  },
              {  "ALMONDS" => {:price => 3.00, :clearance => true}  }
            ]

ap consolidateCart(rand_cart)



def clearance_discount item_price
  item_price - item_price*0.20
end

def in_coups?(item)
  COUPS.each do |item_hash|
    if item_hash[:item] == item
      return true
    else
      return false
    end
  end
end

def checkout cart
  total = 0

  cart.each do |item_hash|
    item_hash.each do |item_and_count, attribute_hash|
      attribute_hash.each do |attribute, value|
      end
    end
  end
end

# [
#     [0] {
#         "KALE" => {
#                   :price => 3.0,
#                   :clearance => false
#                   },
#         :count => 2
#     },

#     [1] {
#         "BLACK_BEANS" => {
#                          :price => 2.5,
#                          :clearance => false
#                          },
#         :count => 2
#     }
# ]


# puts "_" * 40
# ap generateCart
# puts "_" * 40
# ap generateCoups


# #example cart

# [  
#   {  "AVOCADO" => {:price => 3.00, :clearance => true}  }, 
#   {  "AVOCADO" => {:price => 3.00, :clearance => true}  }
#  ]

#   #becomes
# 
# [
#    {"AVOCADO" => {:price => 3.00, :clearance => true}, :count => 2}
# ]



