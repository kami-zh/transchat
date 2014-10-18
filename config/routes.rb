Rails.application.routes.draw do
  resources :rooms, only: [:show, :create]

  resources :messages, only: :create

  root 'pages#home'
end
