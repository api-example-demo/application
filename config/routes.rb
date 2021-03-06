Rails.application.routes.draw do
  resources :people

  namespace :api do
    namespace :v1 do
      resources :people, only: [:index, :create, :update, :destroy, :show] do
        get :all, on: :collection
      end
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failed'

  get '_health', to: 'index#ok'
  root to: "index#show"
end
