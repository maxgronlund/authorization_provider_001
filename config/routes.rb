Rails.application.routes.draw do
  namespace :system do
    resources :address_servers
  end
  namespace :system do
    resources :hosts
  end
  resources :signup, only: [:new, :create]
  #get 'signup/new'
  get 'session/new'
  namespace :system do
    get 'admin/index'
  end
  resources :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
