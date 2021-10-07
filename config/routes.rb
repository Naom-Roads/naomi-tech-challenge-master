Rails.application.routes.draw do

  
  default_url_options :host => "localhost:3000"

  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session  
  end

  resources :metrics, only: [:index, :show, :create]
  root to: "metrics#index"
  get 'show', to: "machine#show"
  get 'search', to: "machine#search"

end
