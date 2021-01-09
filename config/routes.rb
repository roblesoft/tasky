# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects
  resources :homes do
    collection do
      get :login
      get :newsfeed
    end
  end
end
