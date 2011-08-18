DatingOverMeal::Application.routes.draw do
  
  devise_for :users
  
  match '/tour' => 'tour#index', :as => :tour
  
  match '/dashboard' => 'dashboard#index', :as => :dashboard
  
  root :to => "home#index"

end
