Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    get 'unsolved', on: :collection
    get 'solved', on: :collection
    post 'close', on: :member
  end
end
