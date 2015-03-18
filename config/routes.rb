Rails.application.routes.draw do
  resources :stories, only: [:index, :show]
  root 'stories#index'
end
