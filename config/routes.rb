Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :reservations

  #sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  root to: 'welcome#index'
  get 'reservations', to: 'reservations#index'
  get 'calendar'    , to: 'reservations#calendar'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
