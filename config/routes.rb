# frozen_string_literal: true

Rails.application.routes.draw do
  root 'projects#index'
  resources :projects do
    resources :list_columns
    member do
      get :newsfeed
      post :add_user
    end
  end
  resources :tasks do
    member do
      post :change_task_list
    end
  end
  resources :homes do
    collection do
      get :login
      get :sign_up
      post :new_registry
      get :newsfeed
      post :new_session
    end
  end
end
