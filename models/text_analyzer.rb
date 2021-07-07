class TextAnalyzer
    attr_reader :text

    def initialize(text)
        @text = text
    end

    def number_of_words
        words = self.text.split(" ")
        return words.count
    end

    def number_of_vowels
        vowels = self.text.downcase.scan(/[aeoui]/).count
        # binding.pry
        return vowels
    end

    def number_of_consonants
        consonants = self.text.downcase.scan(/[^\Waeiou]/).count
        return consonants
    end

    def most_common_letter
        letter_hash = Hash.new
        arr = self.text.upcase.scan(/[A-Z]/)

        arr.each do |letter|
            if letter_hash[letter]
                letter_hash[letter] += 1
            else
                letter_hash[letter] = 1
            end
        end
        
        #return the array [key,value] of the key with the highest value
        most_freq = letter_hash.max_by {|k,v| v}

        # binding.pry

        return most_freq
    end
end