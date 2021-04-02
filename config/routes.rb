Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :comic_books

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
end
