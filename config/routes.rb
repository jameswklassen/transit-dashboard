# frozen_string_literal: true

Rails.application.routes.draw do
  root 'transactions#index'

  devise_for :users
  resources :transactions, only: %i[index show new create]
  post 'transactions/upload' => 'transactions#upload'
end
