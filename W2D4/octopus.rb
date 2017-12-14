arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


# O(n^2) solution
longest = nil 
arr.each_with_index do |e, i|
  arr.each_with_index do |z, j|
    next if i == j 
    if e.length > z.length
      longest = e 
    end 
  end
end
puts "Longest fish with O(n) #{longest}"

class Array 
  def merge_sort 
    copy = self.dup
    if self.length == 1 || self.length == 0 
      return self 
    end

    middle = copy.length / 2
    left = copy.slice(0, middle).merge_sort
    right = copy.slice(middle, copy.length).merge_sort

    Array.merge(left, right)
  end

  def self.merge(left, right)
    i = 0 
    j = 0 
    temp = []

    while i < left.length && j < right.length 
      if left[i].length >= right[i].length
        temp << left[i]
        i += 1
      else 
        temp << right[i]
        j += 1
      end
    end

    while i < left.length
      temp << left[i]
      i += 1
    end

    while j < right.length 
      temp << right[j]
      j += 1
    end
    temp
  end
end

sorted = arr.merge_sort
puts "Longest fish using nlogn sort #{sorted[0]}"

longest = arr[0] 
arr.each_with_index do |e, i|
  next if i == 0
  if longest.length < e.length 
    longest = e
  end
end

puts "Longest fish using O(n) time #{longest}"

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(string, arr)
  arr.each_with_index do |e, i|
    if e == string
      return i 
      break;
    end
  end
end

puts slow_dance("up", tiles_array)
puts slow_dance("right-down", tiles_array)

new_tiles_data_structure = {}
tiles_array.each_with_index do |e, i|
  new_tiles_data_structure[e] = i
end 

def fast_dance(string, newstuff)
  return newstuff[string]
end


puts fast_dance("up", new_tiles_data_structure)
puts fast_dance("right-down", new_tiles_data_structure)









