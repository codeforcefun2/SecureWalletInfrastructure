Rails.application.routes.draw do
    resources :wallets, only: [:index, :create, :show] do
      post 'sign', on: :member
    end
  
    # Endpoint to trigger the fraud detection job manually
    post 'detect_fraud', to: 'wallets#detect_fraud'
  end
  