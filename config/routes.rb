Rails.application.routes.draw do
  root to: "users#index"

  resources :tournaments do
    resources :events
    resources :teams
    resources :admin_roles
    resources :event_supervisor_roles
  end

  resources :users
end
