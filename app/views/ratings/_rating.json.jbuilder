json.extract! rating, :id, :score, :content, :recipe_id, :created_at, :updated_at
json.url rating_url(rating, format: :json)
