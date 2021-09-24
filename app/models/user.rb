class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :tweets  # 追加
  has_many :favorites  # 追加
  has_many :favorite_tweets, through: :favorites, source: :tweet  # 追加
  has_many :comments, dependent: :destroy  # 追加
  
end
