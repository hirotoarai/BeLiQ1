Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }

  namespace :admins do
    get 'top' => 'customers#index'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  scope module: :users do
    root 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    resources :users, only: [:new, :create, :edit, :update, :destroy]
    resources :posts, only: [:index, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy, :show]
      resource :comments, only: [:create, :destroy, :show]
    end
  end
end