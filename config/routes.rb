Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts
  resources :users do
    member do
      get :verify
      get :ban
      get :decline
    end
  end
  get 'verify', to: 'users#verify', as: 'verify'
  get 'banned', to: 'users#banned', as: 'banned'
  get 'rejected', to: 'users#rejected', as: 'rejected'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "posts#index"
end
