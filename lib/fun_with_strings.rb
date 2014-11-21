module FunWithStrings
  def palindrome?
    str = self.gsub(/\W/,"").downcase
    str == str.reverse ? true : false
  end
  def count_words
     word_freq = Hash.new(0)
     self.downcase.split(/\W/).each do |mem|
     next if mem == ""
     word_freq[mem] += 1
     end
     word_freq
  end
  def anagram_groups
    anagram = Hash.new([])
    
    if self.strip.empty?
      []
    else
      self.split.each do |mem|
        key = mem.downcase.each_char.sort.join

        if anagram.keys.include?(key)
          anagram[key] << mem
        else 
          anagram[key] = [mem]
        end
      end
    end
    anagram.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
