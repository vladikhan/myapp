Rails.application.routes.draw do
  config = Rails.application.config.baukis2

  # -------------------------
  # Staff routes
  # -------------------------
  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
      root "top#index", as: :root

      # Сессии
      get    "login"  => "sessions#new",     as: :login
      post   "login"  => "sessions#create",  as: :session
      delete "logout" => "sessions#destroy", as: :logout

      # Аккаунт сотрудника
      resource :account, except: [:new, :create, :destroy]
    end
  end

  # -------------------------
  # Admin routes
  # -------------------------
  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root "top#index", as: :root

      # Сессии
      get    "login"  => "sessions#new",     as: :login
      post   "login"  => "sessions#create",  as: :session
      delete "logout" => "sessions#destroy", as: :logout

      # Управление сотрудниками и событиями
      resources :staff_members do
        resources :staff_events, only: [:index]
      end
      resources :staff_events, only: [:index]
    end
  end

  # -------------------------
  # Customer routes (без host constraint)
  # -------------------------
  namespace :customer do
    root "top#index"
  end

  # -------------------------
  # Health check & PWA
  # -------------------------
  get "up"             => "rails/health#show",        as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest"       => "rails/pwa#manifest",       as: :pwa_manifest
end