class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :post_comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  attachment :profile_image, destroy: false

  with_options presence: true do
    validates :name
    validates :account_name
  end

  enum user_status: { '有効': true, '退会済': false }

end
