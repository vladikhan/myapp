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
      post   "login"  => "sessions#create",  as: :session  # => staff_session_path
      delete "logout" => "sessions#destroy", as: :logout

      resource :account, except: [:new, :create, :destroy]
      resource :password, only: [:show, :edit, :update]

      resources :customers
      resources :programs do
        resources :entries, only: [] do
          patch :update_all, on: :collection
        end
      end

      get "messages/count" => "ajax#message_count"
      post "message/:id/tag" => "ajax#add_tag", as: :tag_message
      delete "message/:id/tag" => "ajax#remove_tag"

      resources :messages, only: [:index, :show, :destroy] do
        get :inbound, :outbound, :deleted, on: :collection
        delete :destroy_selected, on: :collection
        resource :reply, only: [:new, :create] do
          post :confirm
        end
      end

      resources :tags, only: [] do
        resources :messages, only: [:index] do
          get :inbound, :outbound, :deleted, on: :collection
        end
      end
    end
  end

  # -------------------------
  # Staff routes (для разработки)
  # -------------------------
  namespace :staff do
    root "top#index", as: :root_dev
    get    "login"  => "sessions#new",     as: :login_dev
    post   "login"  => "sessions#create",  as: :session_dev
    delete "logout" => "sessions#destroy", as: :logout_dev

    resource :account, except: [:new, :create, :destroy]
    resource :password, only: [:show, :edit, :update]
    resources :customers
    resources :messages, only: [:index, :show, :destroy] do
      get :inbound, :outbound, :deleted, on: :collection
      delete :destroy_selected, on: :collection
    end
  end

  # -------------------------
  # Admin routes (с host constraint)
  # -------------------------
  constraints host: config[:admin][:host] do
    namespace :admin do
      root "top#index", as: :root

      get    "login"  => "sessions#new",     as: :login
      post   "login"  => "sessions#create",  as: :session  # => admin_session_path
      delete "logout" => "sessions#destroy", as: :logout

      resources :staff_members do
        resources :staff_events, only: [:index]
      end
      resources :staff_events, only: [:index]

      resources :allowed_sources, only: [:index, :create] do
        delete :delete, on: :collection
      end
    end
  end

  # -------------------------
  # Admin routes (для разработки)
  # -------------------------
  namespace :admin do
    root "top#index", as: :root_dev
    get    "login"  => "sessions#new",     as: :login_dev
    post   "login"  => "sessions#create",  as: :session_dev
    delete "logout" => "sessions#destroy", as: :logout_dev

    resources :staff_members do
      resources :staff_events, only: [:index]
    end
    resources :staff_events, only: [:index]

    resources :allowed_sources, only: [:index, :create] do
      delete :delete, on: :collection
    end
  end

  # -------------------------
  # Customer routes (для разработки)
  # -------------------------
  namespace :customer do
    root to: "top#index", as: :root

    get    "login" => "sessions#new",    as: :login
    post   "login" => "sessions#create", as: :login_create
    delete "logout" => "sessions#destroy", as: :logout

    resource :session, only: [:create, :destroy]

    resource :account, except: [:new, :create, :destroy] do
      get   :confirm
      patch :confirm
    end

    resources :programs, only: [:index, :show] do
      resource :entry, only: [:create] do
        patch :cancel
      end
    end

    resources :messages do
      post :confirm, on: :collection
    end
  end

  # -------------------------
  # Root по умолчанию (для разработки)
  # -------------------------
  root to: "staff/sessions#new"

  # -------------------------
  # Health check & PWA
  # -------------------------
  get "up"             => "rails/health#show",        as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest"       => "rails/pwa#manifest",       as: :pwa_manifest
end
