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
  scope :dashboard, module: :dashboard do
    get '/' => 'dashboard#index', as: :dashboard
    get '/report' => 'dashboard#report'
    resources :reverses
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/search_order' => 'search#show', as: :search_order
    end
  end
  mount Sidekiq::Web => '/sidekiq'
end
