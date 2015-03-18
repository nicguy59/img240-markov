Rails.application.routes.draw do
  resources :stories, only: [:show]
  root 'stories#index'
end
