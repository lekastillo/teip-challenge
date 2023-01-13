Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # namespace :web_api do
  #   namespace :v1 do
  #     resource :products, only: %i[index show], defaults: { format: 'json' }
  #   end
  # end

  # namespace :crm_api do
  #   namespace :v1 do
  #     resource :orders
  #   end
  # end
end
