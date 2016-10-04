Rails.application.routes.draw do

  # devise_scope :user do
  #   get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
  #   get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  # end

  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user

  resources :children do
    resources :daily_reports
    get 'daily/reports/:id/communicate', to: 'daily_reports#communicate', as: "daily_report_communicate"
  end
  
  root 'children#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
