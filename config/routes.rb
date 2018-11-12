Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users

  ActiveAdmin.routes(self)

  authenticated :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: "splash#index"

  resources :cms_pages, only: :show, path: :pages
  resources :inquiries
end
