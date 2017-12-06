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
	cho: 21 
	pro: 1.1, 
	fat: 0.5, 
	kcal: 83, 
	category: categories[1]
	)

Ingredient.create(
	name: "Raw Eggs", 
	cho: 0, 
	pro: 36, 
	fat: 22.4, 
	kcal: 320, 
	category: categories[1]
	)

Ingredient.create(
	name: "Pumpkin", 
	cho: 20, 
	pro: 2.7, 
	fat: 0.7, 
	kcal: 83, 
	category: categories[1]
	)

Ingredient.create(
	name: "All Purpose Flour", 
	cho: 455, 
	pro: 13, 
	fat: 1.2, 
	kcal: 455, 
	category: categories[0]
	)
Ingredient.create(
	name: "Oatmeal", 
	cho: 54, 
	pro: 10, 
	fat: 6, 
	kcal: 300, 
	category: categories[0]
	)

Ingredient.create(
	name: "Almond Meal", 
	cho: 20, 
	pro: 28, 
	fat: 60, 
	kcal: 720, 
	category: categories[0]
	)

Ingredient.create(
	name: "Raw Egg White", 
	cho: 0, 
	pro: 27, 
	fat:05, 
	kcal: 133, 
	category: categories[1]
	)

Ingredient.create(
	name: "Raw Egg Yolk", 
	cho: 8.7, 
	pro: 38.4, 
	fat: 64, 
	kcal: 782, 
	category: categories[1]
	)

Ingredient.create(
	name: "Soy milk, unsweetened", 
	cho: 3, 
	pro: 7, 
	fat: 4, 
	kcal: 80, 
	category: categories[1]
	)

Ingredient.create(
	name: "Rice milk, unsweetened", 
	cho: 26, 
	pro: 0.4, 
	fat: 2.5, 
	kcal: 129, 
	category: categories[1]
	)

Ingredient.create(
	name: "Chicken Broth", 
	cho: 1, 
	pro: 2, 
	fat: 0, 
	kcal: 15, 
	category: categories[1]
	)

Ingredient.create(
	name: "Beef Broth", 
	cho: 1, 
	pro: 2, 
	fat: 0, 
	kcal: 15, 
	category: categories[1]
	)

Ingredient.create(
	name: "Canned chicken", 
	cho: 0, 
	pro: 36, 
	fat: 4, 
	kcal: 45, 
	category: categories[1]
	)

Ingredient.create(
	name: "Applesauce", 
	cho: 26.4, 
	pro: 0, 
	fat: 0, 
	kcal: 104, 
	category: categories[1]
	)

Ingredient.create(
	name: "Oil, Sunflower", 
	cho: 0, 
	pro: 0, 
	fat: 218, 
	kcal: 1927, 
	category: categories[1]
	)

Ingredient.create(
	name: "Bran, wheat", 
	cho: 40, 
	pro: 8, 
	fat: 0, 
	kcal: 120, 
	category: categories[0]
	)

Ingredient.create(
	name: "wheat germ", 
	cho: 64, 
	pro: 32, 
	fat: 12, 
	kcal: 480, 
	category: categories[0]
	)

Ingredient.create(
	name: "Sardines in water", 
	cho: 0, 
	pro: 45.6, 
	fat: 19.2, 
	kcal: 352, 
	category: categories[1]
	)