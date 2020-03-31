require 'sidekiq/web'
require 'sidekiq/cron/web'
require 'sidekiq/history'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :people

  namespace :api do
    namespace :v1 do
      resources :people, only: [:index, :create, :update, :destroy, :show] do
        get :all, on: :collection
      end
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failed'

  root to: "index#show"
end
