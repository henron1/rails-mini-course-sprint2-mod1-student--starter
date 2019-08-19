Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers do 
        get "orders", to: "orders#index"
        post "orders", to: "orders#create"
      end
      resources :products, only: [:index, :show]
      post "orders/:id/ship", to: "orders#ship"
      resources :orders, only: [:index, :show] do
        get "products", to: "products#index"
        post "products", to: "products#create"
      end
    end
  end
end
