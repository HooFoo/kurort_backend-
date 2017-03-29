Rails.application.routes.draw do
  resources :point_types
  resources :point_options
  resources :points
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :langs
  resources :user_profiles
  #mount_devise_token_auth_for 'User', at: 'auth'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    post 'users/auth', to: 'users/sessions#auth'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
