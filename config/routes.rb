Rails.application.routes.draw do
  devise_for :genres
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # 会員側のルーティング設定
  scope module: :public do
    root to: "homes#top"
    get '/home/about' => 'homes#about', as: 'about'
    resources :customers, only: [:show, :edit, :update,]
    resources :items, only: [:index, :show]
     # 退会確認画面
    get '/customers/:id/confirm' => 'customers#confirm', as: 'confirm'
  # 論理削除用のルーティング
    patch '/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'

  end
   # 管理者側のルーティング設定
  namespace :admin do
    root 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, omly: [:show, :update]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
