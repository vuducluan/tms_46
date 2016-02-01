Rails.application.routes.draw do

  namespace :admin do
    root "courses#index"
    resources :courses, only: [:index, :show, :edit, :destroy, :update] do
      resources :user_courses, only: [:index, :new, :create]
      resources :supervisors, only: [:index]
      resources :trainees, only: [:index]
    end
    resources :users, only: [:edit, :update]
  end

  devise_for :users, only: [:session, :registration]
  resources :subjects, only: [:index, :show]
  root "static_pages#home"
  get "/about" => "static_pages#about"

  resources :courses, only: [:index, :show] do
    resources :user_courses, only: [:index]
  end
  resources :users, only: [:index, :show]
end
