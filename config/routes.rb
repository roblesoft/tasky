# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#newsfeed'
  resources :projects
  resources :homes do
    collection do
      get :login
      get :newsfeed
      post :new_session
    end
  end
end
