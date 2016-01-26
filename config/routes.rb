Rails.application.routes.draw do
  devise_for :users, only: [:session, :registration]
  root "static_pages#home"
  get "/about" => "static_pages#about"
end
