Rails.application.routes.draw do
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
