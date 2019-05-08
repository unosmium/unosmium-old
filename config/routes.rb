Rails.application.routes.draw do
  root to: "tournaments#index"

  resources :tournaments, only: [:index, :show, :new, :create]
end
