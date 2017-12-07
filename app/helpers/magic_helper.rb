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
								compare_card.color_identity = "Colorless"
							end
							caught = true
						end
					end
				end
			end
			return compare_card
	end

end