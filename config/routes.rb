DatingOverMeal::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  
  match '/tour' => 'tour#index', :as => :tour
  match '/dashboard' => 'dashboard#index', :as => :dashboard
  match '/help' => 'p#help'
  
  match '/users/follow' => 'users#follow'
  
  resources :profiles
  
  resources :thoughts
  
  resources :messages
  
  resources :users
  
  resources :places do
    
    member do
      post :rate
    end
    
  end
  
  resources :images do
    
    member do
      post :make_primary
    end
    
  end
  
  root :to => "home#index"

end
