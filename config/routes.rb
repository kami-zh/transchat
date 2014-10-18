Rails.application.routes.draw do
  resources :rooms, only: [:show, :create]

  root 'pages#home'
end
