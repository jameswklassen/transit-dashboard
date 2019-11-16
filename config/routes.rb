# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'transactions#index'
  resources :transactions, only: [:index, :show]
end
