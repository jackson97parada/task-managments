Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :tasks do
        collection do
          put '/:id/update_enabled', to: 'tasks#update_enabled'
        end
      end
    end
  end

  resources :users, only: %i[create]
  post "/auth/login", to: "authentication#authenticate"

  resources :enterprises do
    collection do
      put '/:id/update_enabled', to: 'enterprises#update_enabled'
    end
  end

  resources :tags do
    collection do
      put '/:id/update_enabled', to: 'tags#update_enabled'
    end
  end

  resources :employees do
    collection do
      put '/:id/update_enabled', to: 'employees#update_enabled'
    end
  end

  resources :tasks_employees
end
