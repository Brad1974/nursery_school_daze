Rails.application.routes.draw do
  
  resources :children do
    resources :daily_reports
  end

  root 'children#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
