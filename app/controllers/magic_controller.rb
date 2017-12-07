class MagicController < ApplicationController

include MagicHelper
#_Card_
#id: #name: #mana_cost: #cmc: #card_type: #artist: #img_url: #created_at: #updated_at: #set_name:#color_identity:#legalities:#sub_types:#rarity:

def index
	prelim_cards = []
	@all_cards = []
	if params[:name].present?
		results = grab_api(params[:name])
		prelim_cards = create_some_cards(results, nil)

		prelim_cards.each do |test_for_image|
			if test_for_image.img_url.present?
				@all_cards.push(test_for_image)
			end
		end

		@all_cards.uniq! do |card|
			card.name
		end
	end
end

def compare
	@card_info = []
	@card = []
	api_call = []
	index_variable = [0, 1]
	if params[:card1].present? && params[:card2].present?
			@card[0] = params[:card1]
			@card[1] = params[:card2]
			api_call[0] = grab_api(params[:card1])
			api_call[1] = grab_api(params[:card2])

			index_variable.each do |index|
				card = single_card(api_call[index], @card[index])
				@card_info.push(card)
			end
	end
end

def allPrint
	@all_cards = []
	card_name = ""
	if params[:name].present?
		card_name = params[:name]
		results = grab_api(params[:name])
		@all_cards = create_some_cards(results, card_name)
	end
end

end