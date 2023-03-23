# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'

  resources :items, only: %i[index show] do
    resources :cart_items, only: %i[index create]
  end
  delete '/cart_items/:id', to: 'cart_items#destroy', as: 'cart_items'
end
