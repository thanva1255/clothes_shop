Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  get "welcome/index"

  resources :collections
  resources :products do
    resources :variant

    member do
      get "delete_modal"
    end
  end

  root "welcome#index"
end
