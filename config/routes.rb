Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'home#index'
  # get '/' => 'home#index'
  root to: "posts#index"

  resources :posts do
    resources :comments, only: [:index, :new, :create]
    resource :like, only: [:show, :create, :destroy]
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]

    resources :followers, only: [:index]
    resources :followings, only: [:index]
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
