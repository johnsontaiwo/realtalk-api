Rails.application.routes.draw do
  #post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do
    #post 'user_token' => 'user_token#create'
    #resources :users 
    #resources :articles 
    resources :articles, except: [:index]  do
      resources :comments
        end
      #end
    end
  end
namespace :api do
    namespace :v1 do
      resources :users do
        resources :articles 
      end
    end
  end
  get 'api/v1/articles', :to => 'api/v1/articles#index'
  get 'api/v1/users/user', :to => 'api/v1/users#show'
  post 'api/v1/users/login', :to => 'api/v1/users#login'
  post 'api/v1/users/signup', :to => 'api/v1/users#create'
  #devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
