Rails.application.routes.draw do
  get 'people/index'

  root to: "app#index"

  namespace :api do
    resources :person, only: [:index,:create, :destroy]
  end
end
