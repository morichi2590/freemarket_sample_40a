Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources 'items'
  get 'mypage/card' => 'mypages#card'
  get 'mypage/logout' => 'mypages#logout'
  get 'transaction/buy/done' => 'transactions#bought'
  resources :mypages, path: 'mypage'
  delete 'items/:id' =>'items#destroy'
  # これ必要な数とアクションでルーティングしないとrake routesがキモい
  # resources :transactions, path: 'transaction/buy/:item_id'

  resources :transactions, path: 'transaction/buy' do
    collection do
      post 'pay/:id' => 'transactions#pay'
      get 'done/:id' => 'transactions#done'
    end
  end
end
