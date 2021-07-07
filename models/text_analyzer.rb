class TextAnalyzer
    attr_reader :text
   
    def initialize(text)
      @text = text.downcase
    end
   
    def count_of_words
      words = text.split(" ")
      words.count
    end
   
    def count_of_vowels
      text.scan(/[aeoui]/).count
    end
   
    def count_of_consonants
      text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
    end
   
    def most_used_letter
      s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces
      arr = s1.split('') # arr = all characters of s1 considered individually WITH duplicates ...[aaabbc]
      arr1 = arr.uniq # arr1 = arr without duplicates ...[abc]
      arr2 = {} #IS A HASH
   
      arr1.map do |c| # for each s1 char (no dup)
        arr2[c] = arr.count(c)  #  key at that s1 char  number of occurances char within s1 (with dup)
      end
    
    
 
      biggest = { arr2.keys.first => arr2.values.first } # a:
 
      arr2.each do |key, value|
        if value > biggest.values.first
          biggest = {}
          biggest[key] = value
        end
      end
   
      biggest
    end
  end