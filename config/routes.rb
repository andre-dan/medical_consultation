Rails.application.routes.draw do
  resources :doctors, :patients, except: [:show]
  root to: 'doctors#index'
end
