Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles, except: [:index]

  resources :films

end
