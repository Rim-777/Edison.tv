Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}


  resources :news, only: [:index ]
  concern :newsable do
    resources :news, only: [:create , :show ]
  end

  resources :users, shallow: true do
    resources :albums, concerns: :newsable, except: :edit do
      resources :pictures, except: :edit
    end
    get :crop_avatar, on: :member
    patch :crop_avatar, on: :member
  end
  root to: "news#index"
end
