Rails.application.routes.draw do
  # get('/', { to: 'welcome#index'})
  # root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get('/', { to: 'posts#index', as: :home })

  #  resources :sessions, only: [:new, :create]
     resources :users, only: [:new, :show, :create]
     resources :posts , only: [:index, :new, :show ,:create]
      do   resources :comments, only: [:index, :new, :create]
     end


end
