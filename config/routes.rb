Rails.application.routes.draw do
  config = Rails.application.config.baukis2

  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
      root "top#index"
      get "login" => "sessions#new", as: :login
      post "login" => "sessions#create"
      delete "logout" => "sessions#destroy", as: :logout
      resource :account, except: [ :new, :create, :destroy ]
    end

  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root "top#index"
      get "login" => "sessions#new", as: :login  
      post "login" => "sessions#create"
      delete "logout" => "sessions#destroy", as: :logout
      resources :staff_members
    end

  namespace :customer do
    root "top#index"
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  end
  end
  end