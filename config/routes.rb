Rails.application.routes.draw do
  
   resources :users do
    member do
      get :following, :followers
    end
  end
  
  match '/signup',  to: 'users#new',            via: 'get'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  match '/logout', to: 'sessions#destroy',     via: 'delete'
  
  root to: 'static_pages#home'
  
  resources :microposts,          only: [:create, :destroy, :show] do
    member do
      put "like", to: "microposts#upvote"
      put "dislike", to: "microposts#downvote"
    end
    
    resources :comments
  end
  
  resources :relationships,       only: [:create, :destroy]
end
