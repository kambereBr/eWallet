Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    root 'home#index', as: :unauthenticated_root
  end

  devise_scope :user do
    authenticated :user do
      root to: "groups#index", as: :authenticated_root
    end
  end

  scope "/" do
    resources :users, only: [:index, :show]
    resources :groups, only: [:index, :show, :new, :create] do
      resources :operations, only: [:index, :show, :new, :create]
    end
  end
end
