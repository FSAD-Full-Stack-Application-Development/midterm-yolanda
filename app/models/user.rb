class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Associations
  has_many :recipes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  
  # Validations
  validates :first_name, :last_name, presence: true
  
  # Methods
  def full_name
    "#{first_name} #{last_name}"
  end
end
