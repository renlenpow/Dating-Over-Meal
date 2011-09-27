DatingOverMeal::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  
  match '/tour' => 'tour#index', :as => :tour
  match '/dashboard' => 'dashboard#index', :as => :dashboard
  match '/help' => 'p#help'
  
  match '/users/follow' => 'users#follow'
  
  match '/webcam/capture' => 'webcam#capture', :as => :webcam_capture
  
  match '/error' => 'error#index', :as => :error
  
  resources :profiles
  
  resources :thoughts
  
  resources :messages
  
  resources :users
  
  resources :places do
    
    member do
      post :rate
      post :like
      post :visit
    end
    
  end
  
  resources :images do
    
    member do
      post :make_primary
    end
    
  end
  
  resources :appointments do
    member do
      post :report_abuse
    end
  end
  
  root :to => "home#index"

end
