Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/', to: 'welcome#index', as: 'root'
  
    get    '/signin',   to: 'sessions#new'
    post   '/signin',   to: 'sessions#create'
    match  '/logout',   to: 'sessions#destroy', via: :delete
    
    resources :users, only: [:new, :create, :show] do
        resources :projects, only: [:index, :new, :create, :show]
    end
    
    resources :crafts, only: [:index, :new, :create, :show]
    resources :materials, only: [:index, :new, :create, :show]

end
