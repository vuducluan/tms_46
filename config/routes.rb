Rails.application.routes.draw do

  devise_for :users, only: [:session, :registration]
  resources :subjects, only: [:index]
  root "static_pages#home"
  get "/about" => "static_pages#about"
  resources :courses, only: [:index]
end
