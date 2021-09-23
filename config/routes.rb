Rails.application.routes.draw do
  
  get 'comments/create'
  get 'comments/destroy'
  # 不要なのでコメントアウト  
  # get 'favorites/create'
  # get 'favorites/destroy' 
  
  # 追加
  root 'tweets#index'
  
  # いらないのでコメントアウト
  #get 'tweets/new'
  #get 'tweets/index'
  #get 'tweets/show'
  #get 'tweets/create'
  #get 'users/index'
  #get 'users/show'
  
  devise_for :users
  
  # ネスト(入れ子)した形に変更
  # コメント機能（作成と削除）
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  # 追加
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
