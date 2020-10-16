Rails.application.routes.draw do
  resources :cards
  resources :lists
  resources :boards
  namespace :users, defaults: {format: :json} do
    post :login 
    post :create
    delete :logout
    get :me
    end
end
