Rails.application.routes.draw do
  devise_for :users

  root to: "apparels#index"

  resources :users, only: %i[show new create]

  resources :apparels, only: %i[index show new create] do
    resources :bookings, only: %i[index show new create] do
      member do
        patch :accept
        patch :reject
        patch :cancel
      end
    end
  end

  get "dashboard", to: "dashboard#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
