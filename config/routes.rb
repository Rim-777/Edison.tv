Rails.application.routes.draw do
  devise_for :users

  resources :news
  resources :users, shallow: true do
    resources :albums, except: :edit  do
      resources :pictures, except: :edit
    end
    get :crop_avatar, on: :member
    patch :crop_avatar, on: :member
  end
  root to: "news#index"
end
