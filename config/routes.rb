Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resources :sessions, only: [:index, :new, :create, :destroy]

end
