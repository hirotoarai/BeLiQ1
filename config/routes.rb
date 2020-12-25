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
    get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    get 'users/search' => 'searchs#search', as: 'search'
    patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw_user'
    get 'mypage' => 'users#mypage', as: 'mypage'
    resources :users, only: [:show, :create, :edit, :update, :destroy]
    resources :posts, only: [:index, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy, :show]
    end
  end
end