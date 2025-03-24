Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :missions, only: %i[index show create] do
    resources :participations, only: %i[create]
  end

  get 'dashboard', to: 'pages#dashboard'
  get 'organisation_dashboard', to: 'pages#organisation_dashboard'

  resources :participations, only: [] do
    member do
      patch :accept
      patch :reject
    end
  end

  resources :favorites, only: %i[create destroy]
end
