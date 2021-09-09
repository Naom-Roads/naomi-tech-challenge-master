Rails.application.routes.draw do
  resources :metrics, only: [:index, :show, :create]
  root to: "metrics#index"
end
