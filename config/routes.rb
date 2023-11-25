Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: "groups#index", as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#home", as: :unauthenticated_root
    end
  end

  scope "/" do
    resources :users, only: [:index, :show]
    resources :groups, only: [:index, :show, :new, :create] do
      resources :operations, only: [:index, :show, :new, :create]
    end
  end
end
