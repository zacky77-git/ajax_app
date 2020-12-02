# rails g controller postsでコントローラーを作成後
class PostsController < ApplicationController
  # indexアクションを定義
  def index
    # 降順ですべてのレコードを@postsに代入
    @posts = Post.all.order(id: "DESC")
  end
  # createアクションを定義
  def create
    # paramsの情報を未読の状態で保存するように
    post = Post.create(content: params[:content], checked: false)
    # JSONでレスポンス
    render json:{ post: post }
  end
  # checkedアクションを定義
  def checked
    # 既読したメモのidで該当するレコードを取得
    post = Post.find(params[:id])
    # 既読であるか否かを判定
    if post.checked
      # 既読を解除するためにfalseへ変更
      post.update(checked: false)
    else
      # 既読にするためtrueへ変更
      post.update(checked: true)
    end
    # 更新したレコードを取得し直し
    item = Post.find(params[:id])
    # JSON形式で返却
    render json: { post: item }
  end

end