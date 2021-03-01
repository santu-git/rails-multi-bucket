Rails.application.routes.draw do
  
  resources :organizations do
    resources :news
  end
  root 'organizations#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
