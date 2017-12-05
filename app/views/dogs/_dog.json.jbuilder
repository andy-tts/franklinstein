json.extract! dog, :id, :name, :age, :breed, :weight, :health_status, :created_at, :updated_at
json.url dog_url(dog, format: :json)
