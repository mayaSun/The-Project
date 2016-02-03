Rails.application.routes.draw do

  devise_for :admins
  devise_for :brokers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#home'
end
