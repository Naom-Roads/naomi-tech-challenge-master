Rails.application.routes.draw do

  default_url_options :host => "localhost:3000"

  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
    get "users/show"
  end

  resources :metrics, only: [:index, :show, :create]
  resources :workstations, only: [:index, :show]
  root to: "metrics#index"


end
