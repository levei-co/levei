require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users,
    path: '', # optional namespace or empty string for no space
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      registration: 'register',
      sign_up: 'signup'
    }


  root 'home#index'
  namespace :dashboard do
    get "/" => "dashboard#index"
  end
  mount Sidekiq::Web => '/sidekiq'
end
