class DNA

  def initialize(original_strand)  
    @original_strand = original_strand
  end

  def hamming_distance(test_strand)
#
######### length loop ##############################    
#
    effective_length = [@original_strand.size, test_strand.size].min
    distance = 0
    (0..(effective_length - 1)).each do |index|
      distance += 1 if @original_strand[index] != test_strand[index] 
    end
    distance
#
########### each_with_index###########################    

#    distance = 0
#    @original_strand.chars.each_with_index do |char, index|
#      test_strand_char = test_strand[index]
#      if test_strand_char
#        distance += 1 if test_strand_char != char
#      end
#    end
#    distance

###############################################################    

#@strand.chars.zip(another_strand.chars).count { |a, b| a != b && b != nil }

###############################################################    
  end
  #

###### zip ###########
  
#  def initialize(strand)
#    @strand = strand.chars
#  end  
#
#  def hamming_distance(other_strand)
#    pairs = @strand.zip(other_strand.chars).take_while { |_, other| other }
#    mutations = pairs.reject do | original_base, other_base |
#      original_base == other_base
#    end
#    mutations.size
#  end

###############################################################    
end
