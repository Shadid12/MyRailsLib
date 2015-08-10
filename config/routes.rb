Rails.application.routes.draw do
  resources :users
  
  match '/signup',  to: 'users#new',            via: 'get'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  match '/logout', to: 'sessions#destroy',     via: 'delete'
  
  root to: 'static_pages#home'
  
  resources :microposts,          only: [:create, :destroy]
end
