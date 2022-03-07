Rails.application.routes.draw do
 
  devise_for :users
  root 'home#index'


   namespace :admin do
    root 'home#index'
    resources :users
    resources :posts
    end


end
