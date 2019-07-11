Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :tests

  # resource :account, controller: :account
  # resources :tests, only: %i[index show]

  # resources :tests do
  #   resources :questions
  # end

  # resources :tests do
  #   resources :questions, shallow: true
  # end

  # GET /tests/beginner
  # POST /tests/1/start
  # resources :tests do
  #   get :beginner, on: :collection
  #
  #   member do
  #     post :start
  #   end
  # end

  # get '/tests', to: 'tests#index'
  # get '/tests/:id', to: 'tests#show', as: :test

  # get '/tests(/:id)', to: 'tests#show'
  # get '/tests/:id/start', to: 'tests#start'
  # get '/tests/:id/start', to: 'tasks#start'

  # match '/tests/:id', to: 'tests#create', via: %i[post put]
  # match '/tests/:id', to: 'tests#create', via: :all

  get '/tests/:id/start', to: 'tests#start'
  get '/tests/:id/start', to: 'tasks#start'

  root to: 'tests#index'
end
