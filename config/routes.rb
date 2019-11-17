# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'transactions#index'

  devise_for :users
  resources :transactions, only: %i[index show new create]
end
