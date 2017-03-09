Rails.application.routes.draw do

  devise_for :users, :skip => [:registrations]
  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user

  resources :children do
    resources :daily_reports
    get 'daily_reports/:id/communicate', to: 'daily_reports#communicate', as: "daily_report_communicate"
  end

  root 'children#index'
end
