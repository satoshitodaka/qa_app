Rails.application.routes.draw do
  root to: 'questions#index'

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
