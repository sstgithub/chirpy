Rails.application.routes.draw do
  resources :chirps
  get '/index', to: 'chirps#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
