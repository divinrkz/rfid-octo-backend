Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cards, only: [:index, :show, :create, :update, :destroy] do
      resources :transactions, only: [:index, :show]
      end
    end
  end
  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:index, :show, :create, :update, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
