Rails.application.routes.draw do

  devise_for :users, only: [:session, :registration]
  resources :subjects, only: [:index, :show]
  root "static_pages#home"
  get "/about" => "static_pages#about"

  resources :courses, only: [:index, :show] do
    resources :user_courses, only: [:index]
  end
  resources :users, only: [:index, :show]
end
