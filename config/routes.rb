Rails.application.routes.draw do
  root 'motorcycles#index'

  devise_for :users

  resources :motorcycles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
