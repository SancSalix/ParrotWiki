Rails.application.routes.draw do
  resources :charges, only: [:new, :create, :destroy]
  get 'charges/destroy' => 'charges#destroy', :as => :downgrade
 
  root 'welcome#index'
  
  resources :wikis

  devise_for :users

end
