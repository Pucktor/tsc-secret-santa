Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :events, only: [:show, :new, :create] do
    resources :participants, only: [:new, :create]
    resources :matches do
      get 'update'
    end
  end
  resources :participants, only: [:destroy]
end
