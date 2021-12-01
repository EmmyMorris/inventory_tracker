Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  scope module: :users do
    resources :products
  end

  get '/register', to: 'users#new'
  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
