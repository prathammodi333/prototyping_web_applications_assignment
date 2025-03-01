class DrinksController < ApplicationController
  def index
    if params[:lookingfor].present?
      # Fetch drinks that start with the given letter
      letter = params[:lookingfor][0].downcase
      @drinks = Drink.fetch_by_letter(letter)
    else
      # Default to fetching drinks starting with letter 'a'
      @drinks = Drink.fetch_by_letter('a')
    end
  end

  def details
    @drink = Drink.lookup_drink(params[:id])
  end
end