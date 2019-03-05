Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/index'
  devise_for :users, path: 'auth'
  resources :tickets
  resources :kinds
  resources :statuses

  namespace :manager do
    resources :tickets
  end

  namespace :account do
    resources :tickets
  end

  root "home#index"

end
