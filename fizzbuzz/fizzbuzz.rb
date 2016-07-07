
1.upto(100) do |i|
  if i % 3 == 00 && i % 5 == 0
    puts "FizzBuzz"
  elseif i % 3 == 0
    puts "Fizz"
  elseif i % 5 == 0
    puts "Buzz"
  else
    puts i
  end
end

1.upto(100) do |i|
  str = ""
  
  str += "Fizz" if i % 3 == 0
  str += "Buzz" if i % 5 == 0
  str += i      if str.blank?
  
  puts str
end

