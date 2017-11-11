Rails.application.routes.draw do

  resources :reservations


  root to: 'welcome#index'
  get 'reservations', to: 'reservations#index'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
