class MagicController < ApplicationController

def index
	@all_cards = []
	if params[:name].present?
		results = HTTParty.get("http://api.magicthegathering.io/v1/cards?name=#{params[:name]}")
		results['cards'].each do |card|
			@all_cards.push(card['name'])
		end
	end
end

end