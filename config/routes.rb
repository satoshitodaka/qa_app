Rails.application.routes.draw do
  root to: 'questions#index'

  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # 自分のユーザーしか操作しないからresourceでOK？
  resources :users, except: :destroy

  namespace :admin do
    resources :users, except: [:new, :create]
  end

  resources :questions do
    get 'unsolved', on: :collection
    get 'solved', on: :collection
    post 'close', on: :member
  end
end
