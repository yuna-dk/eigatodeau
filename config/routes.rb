Rails.application.routes.draw do

  # 顧客
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :customer do
    post "customers/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  # 管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 顧客
  scope module: :public do
    root to: "homes#top"
    resources :post_movies do
      resources :post_comments, only: [:create, :destroy]
    end

    get "customers/my_page" => "customers#mypage", as: "mypage"
    get "customers/:id/show" => "customers#show", as: "customerpage"
    get "costomers/infomation/edit" => "customers#edit"
    patch "customers/information" => "customers#update"
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
    # 検索機能
    get "search" => "searches#search"
  end

    # 管理者
    namespace :admin do
      root to: "homes#top"
      resources :post_movies, only: [:index, :show, :destroy]
      resources :customers, only: [:index, :show, :edit, :update]
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
