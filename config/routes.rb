Rails.application.routes.draw do

  root 'tests#new'

  resources :tests

end
