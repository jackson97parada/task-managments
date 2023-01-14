Rails.application.routes.draw do  
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
  
  resources :tasks do
    collection do
      put '/:id/update_enabled', to: 'tasks#update_enabled'
    end
  end
end
