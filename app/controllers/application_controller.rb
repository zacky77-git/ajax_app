class ApplicationController < ActionController::Base
  # Basic認証を呼び出し
  before_action :basic_auth

  private
  # Basic認証の処理をメソッドとして定義
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # ユーザー名とパスワードを定義
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end
