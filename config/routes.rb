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
    put '/tickets/:id/reopen', to: 'tickets#reopen', as: 'ticket_reopen'
  end

  devise_scope :user do
    authenticated :user do
      root 'account/tickets#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root "home#index"

end
