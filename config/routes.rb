require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  root to: 'timelines#show'

  resources :articles

  resources :items do
    resources :comments, only: [:index, :new, :create]
    resource :like, only: [:show, :create, :destroy]
  end

  resources :accounts, only: [:show] do
    resource :follow, only: [:show, :create]
    resource :unfollow, only: [:create]
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end

  resource :practice

  resource :timeline do
    resource :like, only: [:show, :create, :destroy]
  end

  resource :profile
  


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
