Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :web_api do
    namespace :v1 do
      post 'auth/login'
      post 'auth/signup'
      resources :products, only: [:index, :show]
      resources :product_likes, only: [:create]

      resources :orders, only: [:index, :create] do 
        member do
          post 'add_products'
        end
      end
    end
  end

  namespace :crm_api do
    namespace :v1 do
      resources :products, only: [:create]
      patch "/orders/:order_id/cancel", to: "orders#cancel"
      patch "/orders/:order_id/confirm", to: "orders#confirm"
    end
  end

  # namespace :crm_api do
  #   namespace :v1 do
  #     resource :orders
  #   end
  # end
end
