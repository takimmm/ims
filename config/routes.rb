Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:show, :create] do
    member do
      get :mylists
    end
  end  
  resources :ims, only: [:create, :update, :new, :index, :edit, :show] do
    resource :favorites, only: [:create, :destroy]
  end
end
