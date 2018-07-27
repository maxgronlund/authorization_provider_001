Rails.application.routes.draw do

  namespace :system do
    resources :hosts
    resources :address_servers
    get 'admin/index'
  end
  resources :signup, only: [:new, :create]
  #get 'signup/new'
  get 'session/new'

  resources :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
