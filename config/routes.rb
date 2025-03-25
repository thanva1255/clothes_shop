Rails.application.routes.draw do
  get "welcome/index"

  resources :collections
  resources :products do
    resources :variant
  end

  root "welcome#index"
end
