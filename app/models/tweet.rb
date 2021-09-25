class Tweet < ApplicationRecord
  validates :body, presence: true  #バリデーションしてます
  belongs_to :user  # 追加
  has_many :favorites  # 追加
  has_many :comments, dependent: :destroy  # 追加
  
# 追加 「ツイートがファボしてあるかどうか」を判定
  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end
end
