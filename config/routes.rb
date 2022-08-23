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
      resources :static_pages
      resources :categories
      resources :orders
      root "static_pages#index"
    end
    resources :categories, only: :show
    resources :products do
      collection do
        get :result
      end
    end
    resources :carts
  end
end
