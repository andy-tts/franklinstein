class Recipe < ApplicationRecord
	belongs_to :dog
	has_and_belongs_to_many :ingredients
end
