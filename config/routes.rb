Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'register' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'secret_code#index'

  get "all_secret_code", to: "secret_code#all_codes"
  post "secret_code", to: "secret_code#create"
  delete "secret_code/:id", to: "secret_code#destroy" ,as: 'destroy_secret_code'
 
end
