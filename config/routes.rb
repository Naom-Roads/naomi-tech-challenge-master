Rails.application.routes.draw do

  default_url_options :host => "localhost:3000"

  devise_for :users 
  resources :metrics, only: [:index, :show, :create]
  root to: "application#index"
  get 'metrics', to: 'metrics#index'


end
