Rails.application.routes.draw do
  root to: 'questions#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, except: :destroy

  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :users, except: [:new, :create]
    resources :questions, only: [:index, :show, :destroy]
    resources :answers, only: [:destroy]
  end

  resources :questions do
    collection do
      get 'unsolved'
      get 'solved'
    end

    member do
      post 'close'
    end
    resources :answers, only: [:create, :destroy]
  end
end
