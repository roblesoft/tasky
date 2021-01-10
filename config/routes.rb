# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#newsfeed'
  resources :projects do
    resources :list_columns
  end
  resources :tasks
  resources :homes do
    collection do
      get :login
      get :newsfeed
      post :new_session
    end
  end
end
