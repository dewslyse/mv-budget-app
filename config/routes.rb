Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end

    authenticated do
      root 'categories#index', as: :user
    end

    get 'sign_in', to: 'devise/sessions#new', as: 'sign_in'

    get 'sign_up', to: 'devise/registrations#new', as: 'sign_up'

    get 'sign_out', to: 'devise/sessions#destroy', as: 'sign_out'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "home#index"
  
  # resources :users
  resources :categories
  resources :expenses
end
