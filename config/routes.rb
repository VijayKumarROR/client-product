Rails.application.routes.draw do
  #root 'categories#new'

  resources :categories
  devise_for :users
  devise_scope :user do
    authenticated :user do
    root :to => 'categories#new', as: :authenticated_root
  end
  unauthenticated :user do
    root :to => 'devise/registrations#new', as: :unauthenticated_root
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
