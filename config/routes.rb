Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  get "up" => "rails/health#show", as: :rails_health_check

  # get "bookmarks", to: "bookmarks#index"
  # get "bookmarks/lists", to: "bookmarks#create", as: :lists
  # get "bookmarks/movies", to: "bookmarks#create", as: :movies

  # Defines the root path route ("/")
  root "lists#index"

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]
  # root "posts#index"
end
