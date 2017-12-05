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
	@card1 = ""
	@card2 = ""
	caught1 = false
	caught2 = false
	@card1_info = []
	@card2_info = []
	img_test = nil
	if params[:card1].present? && params[:card2].present?
		@card1 = params[:card1]
		@card2 = params[:card2]
		first_card = HTTParty.get("http://api.magicthegathering.io/v1/cards?name=#{params[:card1]}")
		second_card = HTTParty.get("http://api.magicthegathering.io/v1/cards?name=#{params[:card2]}")

		first_card['cards'].each do |card|
			if card['name'] == params[:card1]
				img_test = [1, card['imageUrl']]
				if img_test[1].present? && caught1 == false
					@card1_info = [card['name'], card['imageUrl'], card['cmc'], card['types'], card['subtypes'], card['rarity'], card['legalities'], card['type'], card['colorIdentity']]
					if @card1_info[8].present? == false
						@card1_info[8] = ["Colorless"]
					end
					caught1 = true
				end
			end
		end

		img_test = nil

		second_card['cards'].each do |card|
			if card['name'] == params[:card2]
				img_test = [1, card['imageUrl']]
				if img_test[1].present? && caught2 == false
					@card2_info = [card['name'], card['imageUrl'], card['cmc'], card['types'], card['subtypes'], card['rarity'], card['legalities'], card['type'], card['colorIdentity']]
					if @card2_info[8].present? == false
						@card2_info[8] = ["Colorless"]
					end
					caught2 = true
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