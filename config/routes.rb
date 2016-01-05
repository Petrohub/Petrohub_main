Rails.application.routes.draw do




  resources :stations do
    resources :tanks
  end

  devise_for :users, skip: [:registration]
  devise_for :retailers
  devise_for :suppliers
  devise_for :admins, skip: [:registration]

  get 'pages/about'
  get 'pages/contact'
  get "retailer/dashboard" => "retailers#dashboard", as: :retailer_dashboard
  get 'admin/dashboard' => "admins#dashboard", as: :admin_dashboard
  get 'supplier/dashboard' => "suppliers#dashboard", as: :supplier_dashboard
  get 'retailer/my_stations' => "retailers#my_stations"





  root to: "pages#home"


end
