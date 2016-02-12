Rails.application.routes.draw do

  root 'pages#home'
  get '/', to: 'pages#home'

  resources :leads , only: [:create]


  devise_for :admins
  devise_for :brokers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
