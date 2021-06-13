# frozen_string_literal: true

Rails.application.routes.draw do
  resources :doctors, only: %i[index]
  root to: 'doctors#index'
end
