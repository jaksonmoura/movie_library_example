require 'sidekiq/web'

MovieLibrary::Application.routes.draw do
  resources :movies

  root 'movies#index'

  mount Sidekiq::Web, at: '/sidekiq'
end
