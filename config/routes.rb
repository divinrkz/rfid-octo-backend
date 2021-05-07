Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cards, only: [:index, :show, :create, :destroy] do
        member do
          put 'update/balance', to: 'cards#update_balance', as: 'cards'
        end
        resources :transactions, only: [:index, :show]
      end
    end
  end
  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:index, :show, :create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
