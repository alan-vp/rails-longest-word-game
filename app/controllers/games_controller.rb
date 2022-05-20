require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = Array.new(8) { ('A'..'Z').to_a.sample }
    # raise
  end

  def score
    @input = params[:word].upcase
    @letters = params[:letters]
    @found_word = read_api(@input)
    # raise
  end

  private

  def read_api(word)
    api_word = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(api_word.read)
    json['found']
  end
end
