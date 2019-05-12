Rails.application.routes.draw do
  root to: "users#index"

  resources :tournaments do
    member do
      get 'results' => 'tournaments#results', as: 'results'
    end

    resources :events do
      member do
        get 'assign_scores' => 'events#assign_scores', as: 'assign_scores'
      end
    end

    resources :teams do 
      member do
        get 'penalize' => 'teams#penalize', as: 'penalize'
      end
    end
    resources :admin_roles
    resources :event_supervisor_roles
    resources :scores, only: %i(create update destroy)
    resources :penalties, only: %i(create update destroy)
  end

  resources :users
end   
