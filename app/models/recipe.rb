class Recipe < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :ratings, dependent: :destroy
  
  # Validations
  validates :name, :description, :cooking_time, presence: true
  validates :cooking_time, numericality: { greater_than: 0 }
  
  # Methods
  def average_rating
    return 0 if ratings.empty?
    ratings.average(:score).to_f.round(1)
  end
end
