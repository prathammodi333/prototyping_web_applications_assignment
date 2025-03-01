# app/models/drink.rb

require 'httparty'

class Drink
  include HTTParty
  base_uri 'https://www.thecocktaildb.com/api/json/v1/1'

  # Fetch drinks starting with a specific letter
  def self.fetch_by_letter(letter)
    response = get('/search.php', query: { f: letter })
    response.parsed_response["drinks"] || []
  end

  # Fetch all drinks by looping over letters a–z (and optionally digits)
  def self.fetch_all_drinks
    all_drinks = []

    ('a'..'z').each do |letter|
      drinks = fetch_by_letter(letter)
      all_drinks.concat(drinks) if drinks
    end

    ('0'..'9').each do |digit|
      drinks = fetch_by_letter(digit)
      all_drinks.concat(drinks) if drinks
    end

    all_drinks
  end

  # Lookup a specific drink by its ID using the lookup endpoint
  def self.lookup_drink(id)
    response = get('/lookup.php', query: { i: id })
    response.parsed_response["drinks"]&.first
  end

  # Optionally, search for drinks by name (if you want fuzzy search)
  def self.search_drinks(name)
    response = get('/search.php', query: { f: name })
    response.parsed_response["drinks"] || []
  end
end