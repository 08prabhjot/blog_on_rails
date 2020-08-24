Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:create, :new, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
end
