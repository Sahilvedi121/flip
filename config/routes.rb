Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
   
   resources :products, only: [:index, :create, :show, :edit, :update, :new, :destroy]
   resources :cartes, only: [:index, :create, :destroy]
   resources :orders, only: [:index, :create, :show]
   resources :profiles, only: [:new, :create, :edit, :update, :index]
   resources :addresses, only: [:new, :create, :edit, :update]
   resources :delivery_details, only: [:new, :create, :index, :show]
  root to: "products#index"
end
 