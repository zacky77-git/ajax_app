Rails.application.routes.draw do
  # トップページへ
  root to: 'posts#index' 
  post 'posts', to: 'posts#create'
  # 既読機能のエンドポイント記述
  get 'posts/:id', to: 'posts#checked'
end
