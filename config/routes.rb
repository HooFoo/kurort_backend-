Rails.application.routes.draw do
  if Rails.env == :production
    default_url_options :host => "mysterious-woodland-36064.herokuapp.com"
  else
    default_url_options :host => "localhost:3000"
  end

  scope '/users', module: :users  do
    get 'current'
    get 'info/:id', action: 'info', as: :user
  end


  resources :attachments do
    collection do
      get 'for_point/:point_id', action: 'for_point'
      get 'for_comment/:comment_id', action: 'for_comment'
    end
  end
  resources :comments do
    collection do
      get 'for_point/:point_id', action: 'for_point'
      get 'my', action: 'my'
    end
  end
  resources :point_types
  resources :point_options
  resources :points do
    collection do
      get 'user_points/:user_id', action: 'user_points'
      get 'my_points', action: 'my_points'
      post 'in', action: 'points_in_rect'
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :langs
  resources :user_profiles
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    post 'users/auth', to: 'users/sessions#auth'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
