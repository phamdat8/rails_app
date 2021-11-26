Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :properties
  get '/product_type/new/:id', to: "product_types#new"
  post '/product_type/new/:id', to: "product_types#create"
  get '/show_product/:id/:type', to: "products#fancy_show"
  root to: "home#index"
end
