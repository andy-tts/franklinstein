json.extract! recipe, :id, :name, :dog_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
