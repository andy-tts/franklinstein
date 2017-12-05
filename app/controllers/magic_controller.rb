class MagicController < ApplicationController

def index
	@all_cards = []
	@image = []
	if params[:name].present?
		results = HTTParty.get("http://api.magicthegathering.io/v1/cards?name=#{params[:name]}")
		results['cards'].each do |card|
			full_card = [card['name'], card['imageUrl'], card['type']]
			@all_cards.push(full_card)
		end
		@all_cards.uniq! do |cardio|
			cardio[0]
		end
	end
end

def compare
	
end

end