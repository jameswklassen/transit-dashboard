# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'transactions#index'
  resources :transactions, only: %i[index show new create]
end
