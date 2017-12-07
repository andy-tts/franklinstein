module MagicHelper

	def grab_api(parameter)
		results = HTTParty.get("http://api.magicthegathering.io/v1/cards?name=#{parameter}")
		return results
	end

	def create_some_cards(results, single_card)
		new_cards = []
		if single_card != nil
			results['cards'].each do |card|
				if card['name'] == single_card
					new_cards.push(Card.new(name: card['name'], mana_cost: card['manaCost'], cmc: card['cmc'], card_type: card['type'], artist: card['artist'], img_url: card['imageUrl'], set_name: card['setName'], color_identity: card['colorIdentity'].to_s, legalities: card['legalities'].to_s, sub_types: card['subtypes'].to_s, rarity: card['rarity']))
				end	
			end
		else
			results['cards'].each do |card|
				new_cards.push(Card.new(name: card['name'], mana_cost: card['manaCost'], cmc: card['cmc'], card_type: card['type'], artist: card['artist'], img_url: card['imageUrl'], set_name: card['setName'], color_identity: card['colorIdentity'].to_s, legalities: card['legalities'].to_s, sub_types: card['subtypes'].to_s, rarity: card['rarity']))
			end
		end
		return new_cards
	end

	def various_info_to_s(card)
		break_array = []
		color = ""
		colors = ""
		first = true
		break_array = card.color_identity.chars
		break_array.each do |char|
			if char == "R" || char == "B" || char == "U" || char == "G" || char == "W" || char === "C"
				if char == "R"
					color = "Red"
				elsif char == "B"
					color = "Black"
				elsif char == "U"
					color = "Blue"
				elsif char == "G"
					color = "Green"
				elsif char == "W"
					color = "White"
				elsif char == "C"
					color = "Colorless"
				end
				if first == true
					colors = colors + color
					first = false
				elsif first == false
					colors = colors + ", " + color
				end
			end
		end

		info = ""
		formats = []
		legalities = []
		legal_format = false
		legal_legality = false
		break_array = card.legalities.split("")
		last = break_array.length
		break_array.each_with_index do |char, index|
			if char != "\"" && char != "[" && char != "]" && char != "{" && char != "}" && char != "=" && char != ">"# && char != ","
				info = info + char
			end
			if info == "format"
				info = ""
				legal_format = true
			elsif info.end_with?(", ") && legal_format == true
				info.chop!
				info.chop!
				formats.push(info)
				info = ""
				legal_format = false
			elsif info == "legality"
				info = ""
				legal_legality = true
			elsif info.end_with?(", ") && legal_legality == true
				info.chop!
				info.chop!
				legalities.push(info)
				info = ""
				legal_legality = false
			elsif last == index+1 && legal_legality == true
				legalities.push(info)
				info = ""
			end
		end

		info = ""

		formats.each_with_index do |formatt, index|
			info = info + " <h4> #{formatt}:</h4> <p>#{legalities[index]} </p> "
		end
		card.legalities = info
		card.color_identity = colors
		return card
	end

	def single_card(results, card_name)
			exists = false
			none = false
			caught = false
			compare_card = Card.new()


			results['cards'].each do |card|
				if card['name'] == card_name && exists == false
					exists = true
				end
			end

			if  results['cards'] == [] || exists == false
				compare_card.name = "[card not found]"
				compare_card.mana_cost = "0"
				compare_card.cmc = 0
				compare_card.card_type = "Basic Land"
				compare_card.artist = "N/A"
				compare_card.img_url = "assets/mtg_back.jpg"
				compare_card.set_name = "N/A"
				compare_card.color_identity = "none"
				compare_card.legalities = "none"
				compare_card.sub_types = "none"
				compare_card.rarity = "Special"
				# = ["[card not found]", "/assets/mtg_back.jpg", "0", [], [], [], ["legalities":[{"format":"Reality","legality":"Banned"}]], "N/A", ["Colorlesss"]]
				none = true
			end

			if none == false
				results['cards'].each do |card|
					if card['name'] == card_name
						if card['imageUrl'].present? && caught == false
							compare_card = Card.new(name: card['name'], mana_cost: card['manaCost'], cmc: card['cmc'], card_type: card['type'], artist: card['artist'], img_url: card['imageUrl'], set_name: card['setName'], color_identity: card['colorIdentity'].to_s, legalities: card['legalities'].to_s, sub_types: card['subtypes'].to_s, rarity: card['rarity'])
							if compare_card.color_identity.present? == false
								compare_card.color_identity = "C"
							end
							caught = true
						end
					end
				end
			end
			compare_card = various_info_to_s(compare_card)
			return compare_card
	end

end