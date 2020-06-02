Rails.application.routes.draw do
  mount OpenApi::Rswag::Ui::Engine => '/api-docs'
  mount OpenApi::Rswag::Api::Engine => '/api-docs'

  resources :broadcasts, only: [:index, :create, :show, :destroy]
  resources :subscriptions, only: [:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
