Rails.application.routes.draw do
  resources :chirps do
    member { put 'vote' }
  end
  get '/index', to: 'chirps#index'
  get '/', to: 'chirps#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
