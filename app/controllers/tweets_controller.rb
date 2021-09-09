class TweetsController < ApplicationController
  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
  before_action :authenticate_user!, except: [:index]
  
  def new
    @tweet = Tweet.new # 新規投稿用の空のインスタンス
  end

  def create
# ============追加================
    @tweet = Tweet.new(tweet_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
    @tweet.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @tweet.save
    redirect_to tweets_path
# =================================
  end
  
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
# ===============追加==============
    @user = @tweet.user
# =================================    
  end

# ===============追加=============
  private
    def tweet_params
      params.require(:tweet).permit(:body) # tweetモデルのカラムのみを許可
    end
# =================================

end
