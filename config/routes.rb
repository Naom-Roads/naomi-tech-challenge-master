Rails.application.routes.draw do

  default_url_options :host => "localhost:3000"

  devise_for :users, path: 'auth', controllers: { sign_in: 'login', sign_out: 'logout'}
  resources :metrics, only: [:index, :show, :create]
  root to: "metrics#index"
 


end
