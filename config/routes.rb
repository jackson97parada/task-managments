Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :tasks do
        collection do
          put '/:id/update_enabled', to: 'tasks#update_enabled'
        end
      end
      resources :users, only: %i[create]
      resources :enterprises
      resources :tags
      resources :employees
    end
  end

  post "/auth/login", to: "authentication#authenticate"

  resources :tasks_employees
end
