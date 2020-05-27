Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index show new create]
end
