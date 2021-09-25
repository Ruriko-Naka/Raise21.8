class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
# ===============追加==============
    @tweets = @user.tweets
    @favorite_tweets = @user.favorite_tweets # 追加

# =================================    
    
  end
end
