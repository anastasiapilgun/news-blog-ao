Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'posts#index'
  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create, :edit, :update]
  end
    namespace :admin do
      resources :posts do
        member do
          get 'publish'
        end
     end
  end
end
