class Card < ApplicationRecord

	def set_info

		if self.color_identity.present? == false
			self.color_identity = "C"
		end

		break_array = []
		color = ""
		colors = ""
		first = true
		break_array = self.color_identity.chars
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
		break_array = self.legalities.split("")
		last = break_array.length
		break_array.each_with_index do |char, index|
			if char != "\"" && char != "[" && char != "]" && char != "{" && char != "}" && char != "=" && char != ">"
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
			info = info + "<h4> #{formatt}:</h4><p>#{legalities[index]}</p>"
		end

		if self.rarity == "Basic Land"
			self.rarity = "Common"
		end

		self.legalities = info
		self.color_identity = colors
	end

end