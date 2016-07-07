# build a method that will return the greatest common divider of two positive integers
# gcd(9, 15) #=> 3
# gcd(100, 11) #=> 1
# gcd(14, 28) #=> 14
#

def gcd(a, b)
  minimum = [a, b].min
  minimum.downto(1) do |divisor|
    return divisor if a % divisor == 0 && b % divisor == 0
  end
end

#def gcd(a, b)
#  divisor = [number1, number2].min
#  while divisor > 0
#    return divisor if number1 % divisor ==0 && number2 % divisor == 0
#    divisor -= 1
#  end
#end
#########################

#def gcd(a, b)
#  array1 = (1..num1).to_a.select do |number1|
#    num1 % number1 == 0
#  end
#  
#  array2 = (1..num2).to_a.select do |number2|
#    num2 % number2 == 0
#  end
#
#  [array1, array2].max
#end


gcd(9, 15) #=> 3
gcd(100, 11) #=> 1
gcd(14, 28) #=> 14

