Rails.application.routes.draw do
  resources :doctors, :patients, except: [:show]
  resources :appointments
  root to: 'doctors#index'
end
