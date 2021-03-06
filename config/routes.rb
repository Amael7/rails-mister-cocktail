Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :doses, only: [:destroy]
end
