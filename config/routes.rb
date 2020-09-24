Rails.application.routes.draw do
  devise_for :users
  root to: 'timelines#show'

  resources :articles
  resources :items do
    resources :comments, only: [:index, :new, :create]
    resource :like, only: [:show, :create, :destroy]
  end
  resource :timeline do
    resource :like, only: [:show, :create, :destroy]
  end
  resource :profile
  


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
