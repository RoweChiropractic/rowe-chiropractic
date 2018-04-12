Rails.application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  authenticated :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: "home#index"

  resources :cms_pages, only: :show, path: :pages
  resources :inquiries
  resources :specialties
end
