# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'

  resources :items, only: %i[index show] do
    resources :cart_items, only: %i[index create]
  end
  resources :cart_items, only: :destroy
end
