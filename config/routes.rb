Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  
  resources :recipes do
    resources :ratings, only: [ :create ]
  end
  
  resources :ratings, only: [ :index, :show, :edit, :update, :destroy ]
  
  get "up" => "rails/health#show", as: :rails_health_check
end
