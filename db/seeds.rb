# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 
	categories = [
	"Dry Ingredients",
	"Wet Ingredients",
 "Additives"]
	

Ingredient.create(
	name: "Blueberries", 
	cho: 20, 
	pro: 10, 
	fat: 5, 
	kcal: 15, 
	category: categories[1]
	)

Ingredient.create(
	name: "Raw Eggs", 
	cho: 3, 
	pro: 15, 
	fat: 10, 
	kcal: 20, 
	category: categories[1]
	)

Ingredient.create(
	name: "Pumpkin", 
	cho: 10, 
	pro: 2, 
	fat: 0, 
	kcal: 10, 
	category: categories[1]
	)

Ingredient.create(
	name: "All Purpose Flour", 
	cho: 20, 
	pro: 10, 
	fat: 5, 
	kcal: 15, 
	category: categories[0]
	)
Ingredient.create(
	name: "Oatmeal", 
	cho: 20, 
	pro: 10, 
	fat: 5, 
	kcal: 15, 
	category: categories[0]
	)

Ingredient.create(
	name: "Almond Meal", 
	cho: 20, 
	pro: 10, 
	fat: 5, 
	kcal: 15, 
	category: categories[0]
	)

Ingredient.create(
	name: "Fish Oil", 
	cho: 20, 
	pro: 10, 
	fat: 5, 
	kcal: 15, 
	category: categories[2]
	)