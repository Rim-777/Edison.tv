Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}


  # resources :users do
  #   resources :albums, except: [:new, :edit, :update]
  # end

  resources :news, only: :index

  resources :news, only: :create

  resources :albums, only: [:create, :destroy] do
    resources :pictures, only: [:create, :destroy]
    resources :news, only: :create
  end

  resources :users do
    resources :albums, only: [:show, :index]
    get :crop_avatar, on: :member
    patch :crop_avatar, on: :member
  end
  root to: "news#index"
end
