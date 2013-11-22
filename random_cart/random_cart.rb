require 'awesome_print'
require 'debugger'

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





def in_coups?(item)
  return_val = false
  COUPS.each do |item_hash|
    if item_hash[:item] == item
      return_val = true
    end
  end
  return_val
end

Item = Struct.new(:name, :price, :clearance, :coupon)

def itemify
  item_objects = []

  ITEMS.each do |item_hash|
    item_hash.each do |item, attribute_hash|
      new_item_obj = Item.new(item, attribute_hash[:price], attribute_hash[:clearance])
      if in_coups?(item)
        new_item_obj.coupon = true
      end
      item_objects << new_item_obj
    end
  end
  item_objects
end

ITEM_OBJECTS = itemify  #AN ARRAY OF ITEM OBJECTS


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
  uniq_item_list = cart.uniq
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


def on_clearance?(item_input)
  return_val = false
  ITEM_OBJECTS.each do |item|
    if item.name == item_input
      return_val = item.clearance
    end
  end
  return_val
end


def clearance_discount(item, discount_ratio)
  discounted_item_array = ITEM_OBJECTS.select {|item_obj| item_obj.name == item}
  discounted_item = discounted_item_array[0]
  discounted_item.price - discounted_item.price * discount_ratio
end

def coup_discount(item, quantity)
  total = 0
  item_obj = ITEM_OBJECTS.select {|element| element.name == item}
  normal_price = item_obj[0].price
  COUPS.each do |coupon_hash|
    if coupon_hash[:item] == item
      non_coupon_items = quantity % coupon_hash[:num]
      coupon_items = (quantity / coupon_hash[:num]).to_i
      total = coupon_items*coupon_hash[:cost] + non_coupon_items*normal_price
    end
  end
  total
end

def two_coupons?(item, coup_array)  #checks 
  return_val = false
  coup_array.each do |coupon_hash|
    if coupon_hash[:item] == item && coupon_hash[:num] >= 2
      return_val = true
    end
  end
  return_val
end

def checkout(cart, coupons)
  num_total = 0
  total = []
  cart.each do |item_hash|
    debugger

    item_hash.each do |item_and_count, attribute_hash|
      debugger
      if item_and_count.class == String
        debugger
        attribute_hash.each do |attribute, value|
          debugger
          if on_clearance?(item_and_count)
            debugger
            if in_coups?(item_and_count) && two_coupons?(item_and_count, coupons)
              debugger
              clearance_price_for_one_item = clearance_discount(item_and_count, 0.60)
              total << clearance_price_for_one_item*item_hash[:count]
            end
          else
            debugger
            clearance_price_for_one_item = clearance_discount(item_and_count, 0.20)
            clearance_price_for_one_item
            debugger
            total << clearance_price_for_one_item*item_hash[:count]
            debugger
            puts
          end
        end
      end
    end
  end
  discount = total.all? {|item_price| item_price < 5.0}
  if discount
    num_total = total.inject {|sum, item_price| sum + item_price} 
  end
  num_total
end

cart = consolidateCart(generateCart)
ap cart
puts checkout(cart, generateCoups)

# checkout(generateCart)

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



