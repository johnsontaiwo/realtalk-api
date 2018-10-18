Rails.application.routes.draw do
  resources :users
  resources :articles do
    resources :comments
  end
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
