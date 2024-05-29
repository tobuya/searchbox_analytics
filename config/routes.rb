Rails.application.routes.draw do
  root 'search_terms#index'
  resources :search_terms, only: [:index, :create]

  # Mount ActionCable at '/cable' endpoint for real-time features
  mount ActionCable.server => '/cable'
end
