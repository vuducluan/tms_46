Rails.application.routes.draw do

  namespace :admin do
    root "courses#index"
    resources :courses do
      resources :user_courses, only: [:index, :new, :create]
      resources :supervisors, only: [:index]
      resources :trainees, only: [:index]
      resources :course_subjects, only: [:index]
    end
    resources :course_subjects, only: [:update, :show]
    resources :users
    resources :subjects
  end

  devise_for :users, controllers: { registrations: "users/registrations"
  }, only: [:session, :registration]

  resources :subjects, only: [:index, :show, :update]
  root "static_pages#home"
  get "/about" => "static_pages#about"

  resources :courses, only: [:index, :show] do
    resources :user_courses, only: [:index]
    resources :course_subjects, only: [:show]
  end
  resources :users, only: [:index, :show, :update]
  resources :user_subjects, only: [:update]
  require "sidekiq/web"
  mount Sidekiq::Web, at: "/sidekiq"
end
