require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]

    analyzedtext = TextAnalyzer.new(text_from_user)

    @words_count = analyzedtext.number_of_words

    @vowels_count = analyzedtext.number_of_vowels

    @consonant_count = analyzedtext.number_of_consonants
    
    @letter_key = analyzedtext.most_common_letter.first
    @letter_value = analyzedtext.most_common_letter.last

    erb :results
  end
end
