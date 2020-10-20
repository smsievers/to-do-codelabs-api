Rails.application.routes.draw do
  resources :cards
  namespace :lists, defaults:{ format: :json } do
    get :index
    get :show
    post :create
    patch :update
    delete :destroy
  end
  namespace :boards, defaults:{ format: :json } do
    get :index
    get :show
    post :create
    patch :update
    delete :destroy
    end
  namespace :users, defaults: {format: :json} do
    post :login 
    post :create
    delete :logout
    get :me
    end
end
