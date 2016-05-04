Rails.application.routes.draw do
  devise_for :users

  resources :news
  resources :users do
    get :crop_avatar, on: :member
    patch :crop_avatar, on: :member
  end
  root to: "news#index"
end
