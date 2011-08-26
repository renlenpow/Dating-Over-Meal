DatingOverMeal::Application.routes.draw do
  
  devise_for :users
  
  match '/tour' => 'tour#index', :as => :tour
  match '/dashboard' => 'dashboard#index', :as => :dashboard
  match '/help' => 'p#help'
  
  match '/users/follow' => 'users#follow'
  
  resources :profiles
  
  resources :thoughts
  
  resources :messages
  
  resources :users
  
  resources :places
  
  resources :images do
    
    member do
      post :make_primary
    end
    
  end
  
  root :to => "home#index"

end
