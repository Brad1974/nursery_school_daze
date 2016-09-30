Rails.application.routes.draw do

  devise_for :users
  resources :children do
    resources :daily_reports
    get 'daily/reports/:id/communicate', to: 'daily_reports#communicate', as: "daily_report_communicate"
  end
  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user


  root 'children#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
