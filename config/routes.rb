Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "groups#index"
  namespace :admin do 
    root "groups#index"
  end
  resources :users, only: [:show, :edit, :update, :destroy]

  resources :groups do
    resources :events, only: [:new, :create, :show, :edit, :update, :destroy]
      member do
      get :groupedit_members
      get :groupedit_photos
      get :groupedit_about
      get :groupshow_about
      get :groupshow_member
      get :groupshow_event
      get :groupshow_comment
      get :groupshow_photo
    end
  end
end