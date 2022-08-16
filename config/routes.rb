Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/detail", to: "static_pages#detail"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users

    namespace :admin do
      get "search", to: "products#index"
      resources :static_pages
      resources :categories
      resources :orders
      resources :products
      resources :users
      root "static_pages#index"
    end
    resources :ratings
    resources :order_details
    resources :categories, only: :show
    resources :products do
      collection do
        get :result
      end
    end
    resources :carts
    resources :orders do
      member do
        get :change
      end
    end
  end
end
