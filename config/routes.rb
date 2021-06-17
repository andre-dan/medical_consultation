Rails.application.routes.draw do
  resources :doctors, except: [:show]
  root to: 'doctors#index'
end
