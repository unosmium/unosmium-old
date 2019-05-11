Rails.application.routes.draw do
  root to: "tournaments#index"

  resources :tournaments do
    resources :events
    resources :teams
    resources :admin_roles
  end

  resources :users
end
