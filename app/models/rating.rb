class Rating < ApplicationRecord
  # Associations
  belongs_to :recipe
  belongs_to :user
  
  # Validations
  validates :score, presence: { message: "is required" }, 
                   inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :content, presence: { message: "cannot be empty" }, 
                     length: { minimum: 10, message: "must be at least 10 characters long" }
  validates :user_id, uniqueness: { scope: :recipe_id, message: "can only rate a recipe once" }
end
