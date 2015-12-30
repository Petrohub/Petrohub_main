Rails.application.routes.draw do


  devise_for :retailers
  devise_for :suppliers
  devise_for :admins
  get 'pages/about'
  get 'pages/contact'
  root to: "pages#home"

   namespace :retailers do
    root to: "pages#home"
  end
end
