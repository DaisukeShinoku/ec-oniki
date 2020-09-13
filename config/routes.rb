Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :products, only: [:index, :show]
  resources :destinations, only: [:new, :index, :create, :edit, :update, :destroy]

  resources :cart_products, only: [:index, :update, :create, :destroy] do
    collection do
      delete :destroy_all
    end
  end

  resources :orders, only: [:new, :create, :index, :show] do
    collection do
      get :confirm
      get :thanks
    end
  end

  namespace :admin do
    get '/top', to: 'homes#top' 
    resources :products
    resources :users, only: [:index, :show, :edit, :update]
    patch '/admin/orders/:order_product_id', to: 'admin/orders#work_update'
    resources :orders,only: [:index, :show, :update] do
      member do
        patch :order_update
      end
    end
  end
end
