# Instructions:
# Return an array that contains the squares of
# all elements in an array?

def square_array(some_array)
  some_array.collect {|element| element**2}
end
