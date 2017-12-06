class MagicController < ApplicationController

def index
	@all_cards = []
	prelim_cards = []
	if params[:name].present?
		results = HTTParty.get("http://api.magicthegathering.io/v1/cards?name=#{params[:name]}")
		results['cards'].each do |card|
			full_card = [card['name'], card['imageUrl'], card['type']]
			prelim_cards.push(full_card)
		end
		prelim_cards.each do |test_img|
			if test_img[1].present?
				@all_cards.push(test_img)
			end
		end
		@all_cards.uniq! do |cardio|
			cardio[0]
		end
	end
end

def compare
	@card_info = []
	@card = []
	api_call = []
	exists = [false, false]
	none = [false, false]
	img_test = [nil, nil]
	caught = [false, false]
	if params[:card1].present? && params[:card2].present?
			@card[0] = params[:card1]
			@card[1] = params[:card2]
			api_call[0] = HTTParty.get("http://api.magicthegathering.io/v1/cards?name=#{params[:card1]}")
			api_call[1] = HTTParty.get("http://api.magicthegathering.io/v1/cards?name=#{params[:card2]}")

			api_call.each_with_index do |api_info, index|
				api_call[index]['cards'].each do |card|
					if card['name'] == @card[index] && exists[index] == false
						exists[index] = true
					end
				end

				if  api_call[index]['cards'] == [] || exists[index] == false
					@card_info[index] = ["[card not found]", "/assets/mtg_back.jpg", "0", [], [], [], [{"format":"Reality","legality":"Banned"}], "N/A", ["Colorlesss"]]
					none[index] = true
				end

				if none[index] == false
					api_call[index]['cards'].each do |card|
						if card['name'] == @card[index]
							img_test[index] = [1, card['imageUrl']]
							if img_test[index][1].present? && caught[index] == false
								@card_info[index] = [card['name'], card['imageUrl'], card['cmc'], card['types'], card['subtypes'], card['rarity'], card['legalities'], card['type'], card['colorIdentity']]
								if @card_info[index][8].present? == false
									@card_info[index][8] = ["Colorless"]
								end
								caught[index] = true
							end
						end
					end
				end
			end
	end
end

def allPrint
	@all_cards = []
	@card_name = ""
	if params[:name].present?
		results = HTTParty.get("http://api.magicthegathering.io/v1/cards?name=#{params[:name]}")
		results['cards'].each do |card|
			if card['name'] == params[:name]
				@card_name = card['name']
				full_card = [card['imageUrl'], card['setName'], card['artist']]
				@all_cards.push(full_card)
			end
		end
	end
end

end