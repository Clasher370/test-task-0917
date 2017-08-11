require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :sync do
      get 'users/start', to: 'users#start'
      get 'users/stop', to: 'users#stop'
      get 'users/count', to: 'users#count'
    end
  end
end
