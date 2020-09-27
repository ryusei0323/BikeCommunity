class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :post_comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #throughで使うモデルは必ず先に関連付けを行っていなければならない(今回で言う上記のfavorites)
  has_many :favorite_posts, through: :favorites, source: :post

  attachment :profile_image, destroy: false

  with_options presence: true do
    validates :name
    validates :account_name
  end

  enum user_status: { '有効': true, '退会済': false }

  def active_for_authentication?
  super && self.user_status == '有効'
end

end
