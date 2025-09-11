Rails.application.routes.draw do
  config = Rails.application.config.baukis2

  # -------------------------
  # Staff routes (с host constraint)
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
      resource :password, only: [:show, :edit, :update]

      # Customers
      resources :customers
      resources :programs do 
        resources :entries, only: [] do
          patch :update_all, on: :collection
        end
      end
    end
  end

  # -------------------------
  # Staff routes (без host constraint, для разработки)
  # -------------------------
  namespace :staff do
    root "top#index", as: :root_dev

    # Сессии
    get    "login"  => "sessions#new"
    post   "login"  => "sessions#create"
    delete "logout" => "sessions#destroy"

    # Аккаунт сотрудника
    resource :account, except: [:new, :create, :destroy]
    resource :password, only: [:show, :edit, :update]

    # Customers
    resources :customers
  end

    # -------------------------
  # Admin routes (с host constraint)
  # -------------------------
  constraints host: config[:admin][:host] do
    namespace :admin do
      root "top#index", as: :root

      get    "login"  => "sessions#new",     as: :login
      post   "login"  => "sessions#create",  as: :session
      delete "logout" => "sessions#destroy", as: :logout

      resources :staff_members do
      resources :staff_events, only: [:index]
      end
      resources :staff_events, only: [:index]
      resources :allowed_sources, only: [ :index, :create ] do
        delete :delete, on: :collection
      end
    end
  end

  # -------------------------
  # Admin routes (без host constraint, для разработки)
  # -------------------------
  namespace :admin do
    root "top#index", as: :root_dev

    get    "login"  => "sessions#new"
    post   "login"  => "sessions#create"
    delete "logout" => "sessions#destroy"

    resources :staff_members do
      resources :staff_events, only: [:index]
    end
    resources :staff_events, only: [:index]
  end
  # -------------------------
  # Customer routes (без host constraint)
  # -------------------------
  namespace :customer do
    root to: "top#index"

    get    "login" => "sessions#new", as: :login
    post   "login" => "sessions#create", as: :login_create
    delete "logout" => "sessions#destroy", as: :logout

    resource :session, only: [ :create, :destroy ]
  end

  # -------------------------
  # Health check & PWA
  # -------------------------
  get "up"             => "rails/health#show",        as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest"       => "rails/pwa#manifest",       as: :pwa_manifest
end
