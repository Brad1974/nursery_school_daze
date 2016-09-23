Rails.application.routes.draw do

  devise_for :users
  resources :children do
    resources :daily_reports
    get 'daily/reports/:id/communicate', to: 'daily_reports#communicate', as: "daily_report_communicate"
  end
  resources :users

  root 'children#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
